/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'dart:io';
// import 'dart:ffi';
import 'dart:ffi';

import 'dart:async';
import 'dart:collection';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'package:ayleio/dart/core/media_universe/media_kit_fork.dart';
// ignore_for_file: unused_import, implementation_imports
import 'package:ayleio/dart/core/media_universe/ffi/ffi.dart';
import 'package:ayleio/dart/core/media_universe/src/player/native/core/native_library.dart';

import 'package:ayleio/dart/core/media_universe/generated/libmpv/bindings.dart';

import 'package:ayleio/dart/core/media_universe_video/src/utils/query_decoders.dart';
import 'package:ayleio/dart/core/media_universe_video/src/video_controller/video_controller.dart';
import 'package:ayleio/dart/core/media_universe_video/src/video_controller/platform_video_controller.dart';

/// {@template native_video_controller}
///
/// NativeVideoController
/// ---------------------
///
/// The [PlatformVideoController] implementation based on native C/C++ used on:
/// * Windows
/// * GNU/Linux
/// * macOS
/// * iOS
///
/// {@endtemplate}
class NativeVideoController extends PlatformVideoController {
  /// Whether [NativeVideoController] is supported on the current platform or not.
  static bool get supported =>
      Platform.isWindows ||
      Platform.isLinux ||
      Platform.isMacOS ||
      Platform.isIOS;

  /// Fixed width of the video output.
  int? width;

  /// Fixed height of the video output.
  int? height;

  /// {@macro native_video_controller}
  NativeVideoController._(super.player, super.configuration)
      : width = configuration.width,
        height = configuration.height;

  /// {@macro native_video_controller}
  static Future<PlatformVideoController> create(
    Player player,
    VideoControllerConfiguration configuration,
  ) async {
    // Retrieve the native handle of the [Player].
    final handle = await player.handle;
    // Return the existing [VideoController] if it's already created.
    if (_controllers.containsKey(handle)) {
      return _controllers[handle]!;
    }

    // In case no video-decoders are found, this means media_kit_libs_***_audio is being used.
    // Thus, --vid=no is required to prevent libmpv from trying to decode video (otherwise bad things may happen).
    //
    // Search for common H264 decoder to check if video support is available.
    final decoders = await queryDecoders(handle);
    if (!decoders.contains('h264')) {
      throw UnsupportedError(
        '[VideoController] is not available.'
        ' '
        'Please use media_kit_libs_***_video instead of media_kit_libs_***_audio.',
      );
    }

    // Creation:
    final controller = NativeVideoController._(player, configuration);

    // Register [_dispose] for execution upon [Player.dispose].
    player.platform?.release.add(controller._dispose);

    // Store the [NativeVideoController] in the [_controllers].
    _controllers[handle] = controller;

    // ----------------------------------------------
    NativeLibrary.ensureInitialized();
    final mpv = MPV(DynamicLibrary.open(NativeLibrary.path));
    final values = {
      'vo': configuration.vo ?? 'libmpv',
      'hwdec': configuration.hwdec ?? 'auto',
      'vid': 'auto',
    };
    for (final entry in values.entries) {
      final property = entry.key.toNativeUtf8();
      final value = entry.value.toNativeUtf8();
      mpv.mpv_set_property_string(
        Pointer.fromAddress(handle),
        property.cast(),
        value.cast(),
      );
      calloc.free(property);
      calloc.free(value);
    }
    // ----------------------------------------------

    // Wait until first texture ID is received i.e. render context & EGL/D3D surface is created.
    // We are not waiting on the native-side itself because it will block the UI thread.
    // Background platform channels are not a thing yet.
    final completer = Completer<void>();
    void listener() {
      if (controller.id.value != null) {
        completer.complete();
      }
    }

    controller.id.addListener(listener);

    await _channel.invokeMethod('VideoOutputManager.Create', {
      'handle': handle.toString(),
      'configuration': {
        'width': configuration.width.toString(),
        'height': configuration.height.toString(),
        'enableHardwareAcceleration': configuration.enableHardwareAcceleration,
      },
    });

    await completer.future;
    controller.id.removeListener(listener);

    // Return the [VideoController].
    return controller;
  }

  /// Sets the required size of the video output.
  /// This may yield substantial performance improvements if a small [width] & [height] is specified.
  ///
  /// Remember:
  /// * “Premature optimization is the root of all evil”
  /// * “With great power comes great responsibility”
  @override
  Future<void> setSize({int? width, int? height}) async {
    final handle = await player.handle;
    if (this.width == width && this.height == height) {
      // No need to resize if the requested size is same as the current size.
      return;
    }
    if (width != null && height != null) {
      this.width = width;
      this.height = height;
      await _channel.invokeMethod('VideoOutputManager.SetSize', {
        'handle': handle.toString(),
        'width': width.toString(),
        'height': height.toString(),
      });
    } else {
      this.width = null;
      this.height = null;
      await _channel.invokeMethod(
        'VideoOutputManager.SetSize',
        {'handle': handle.toString(), 'width': 'null', 'height': 'null'},
      );
    }
  }

  /// Disposes the instance. Releases allocated resources back to the system.
  Future<void> _dispose() async {
    final handle = await player.handle;
    _controllers.remove(handle);
    await _channel.invokeMethod(
      'VideoOutputManager.Dispose',
      {'handle': handle.toString()},
    );
  }

  /// Currently created [NativeVideoController]s.
  /// This is used to notify about updated texture IDs & [Rect]s through [_channel].
  static final _controllers = HashMap<int, NativeVideoController>();

  /// [MethodChannel] for invoking platform specific native implementation.
  static final _channel = () {
    const MethodChannel methodChannel = MethodChannel(
      'general_developer.library.media_universe/media_universe_flutter',
    );
    methodChannel.setMethodCallHandler((MethodCall call) async {
      try {
        switch (call.method) {
          case 'VideoOutput.Resize':
            {
              // Notify about updated texture ID & [Rect].
              final int handle = call.arguments['handle'];
              final Rect rect = Rect.fromLTWH(
                call.arguments['rect']['left'] * 1.0,
                call.arguments['rect']['top'] * 1.0,
                call.arguments['rect']['width'] * 1.0,
                call.arguments['rect']['height'] * 1.0,
              );
              final int id = call.arguments['id'];
              _controllers[handle]?.rect.value = rect;
              _controllers[handle]?.id.value = id;
              // Notify about the first frame being rendered.
              if (rect.width > 0 && rect.height > 0) {
                final completer =
                    _controllers[handle]?.waitUntilFirstFrameRenderedCompleter;
                if (!(completer?.isCompleted ?? true)) {
                  completer?.complete();
                }
              }
              break;
            }
          default:
            {
              break;
            }
        }
      } catch (exception, stacktrace) {
        debugPrint(exception.toString());
        debugPrint(stacktrace.toString());
      }
    });
    return methodChannel;
  }();
}
