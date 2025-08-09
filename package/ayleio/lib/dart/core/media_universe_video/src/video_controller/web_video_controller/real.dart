/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.

// ignore_for_file: unnecessary_brace_in_string_interps

library;

// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:async';
// import 'dart:js/js_wasm.dart';
import "dart:js_interop";
import 'dart:js_interop_unsafe';
// import 'dart:js_interop_unsafe' as js_interop_unsafe;
import "package:web/web.dart" as web;
import 'dart:ui_web';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';
import 'package:ayleio/dart/core/media_universe/media_kit_fork.dart';

import 'package:ayleio/dart/core/media_universe_video/src/video_controller/platform_video_controller.dart';

/// {@template web_video_controller}
///
/// WebVideoController
/// ------------------
///
/// The [WebVideoController] implementation based on HTML & JavaScript used on web.
///
/// {@endtemplate}
class WebVideoController extends PlatformVideoController {
  /// Whether [WebVideoController] is supported on the current platform or not.
  static const bool supported = kIsWeb;

  /// {@macro web_video_controller}
  WebVideoController._(super.player, super.configuration);

  /// {@macro web_video_controller}
  static Future<PlatformVideoController> create(
    Player player,
    VideoControllerConfiguration configuration,
  ) async {
    // Retrieve the native handle of the [Player].
    final handle = await player.handle;

    final controller = WebVideoController._(player, configuration);
    // Register [_dispose] for execution upon [Player.dispose].
    player.platform?.release.add(controller._dispose);

    // web.window.getProperty(property);
    // Retrieve the [html.VideoElement] instance from [js.context].
    //
    // web.window.getProperty(_kInstances.toJS).dartify();
    //

    controller._element = (web.window.getProperty(_kInstances.toJS)
        as JSObject)["${handle}"] as web.HTMLVideoElement;
    // Register the [html.VideoElement] as platform view.
    platformViewRegistry.registerViewFactory(
      'general_developer.library.media_universe.$handle',
      (int _) => controller._element!,
    );

    // On web implementation, we are having [handle] & [controller.id] same, which in itself is a simple counter based value managed within [Player].
    // Since there is no texture creation or rendering involved.
    controller.id.value = handle;

    // Listen to the resize event of the [html.VideoElement].
    controller._resizeStreamSubscription =
        controller._element?.onResize.listen((event) {
      // Update the size of the [PlatformVideoController].
      controller.rect.value = Rect.fromLTWH(
        0.0,
        0.0,
        controller._element?.videoWidth.toDouble() ?? 0.0,
        controller._element?.videoHeight.toDouble() ?? 0.0,
      );
    });

    // Notify about the first frame being rendered.
    // Case: If some [Media] is already playing when [VideoController] is created.
    if (player.state.width != null && player.state.height != null) {
      if (!controller.waitUntilFirstFrameRenderedCompleter.isCompleted) {
        controller.waitUntilFirstFrameRenderedCompleter.complete();
      }
    }

    controller._element?.onCanPlayThrough.listen((_) {
      // Notify about first frame being rendered.
      if (!controller.waitUntilFirstFrameRenderedCompleter.isCompleted) {
        controller.waitUntilFirstFrameRenderedCompleter.complete();
      }
    });

    // Return the [PlatformVideoController].
    return controller;
  }

  /// Sets the required size of the video output.
  /// This may yield substantial performance improvements if a small [width] & [height] is specified.
  ///
  /// Remember:
  /// * “Premature optimization is the root of all evil”
  /// * “With great power comes great responsibility”
  @override
  Future<void> setSize({int? width, int? height}) {
    throw UnsupportedError(
      '[AndroidVideoController.setSize] is not available on web',
    );
  }

  /// Disposes the instance. Releases allocated resources back to the system.
  Future<void> _dispose() async {
    // Close the resize event stream subscription.
    await _resizeStreamSubscription?.cancel();
  }

  /// HTML [html.VideoElement] instance reference.
  web.HTMLVideoElement? _element;

  StreamSubscription<web.Event>? _resizeStreamSubscription;

  /// JavaScript object attribute used to store various [VideoElement] instances in [js.context].
  static const _kInstances =
      '\$general_developer.library.media_universe.media_universe_flutter.instances';
}
