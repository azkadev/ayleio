/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'dart:collection';
import 'dart:ffi' ;

import 'package:ayleio/dart/core/media_universe/ffi/ffi.dart';
import 'package:ayleio/dart/core/media_universe/generated/libmpv/bindings.dart' as generated;
import 'package:ayleio/package/synchronized/lib/synchronized.dart';

/// {@template initializer_native_callable}
///
/// InitializerNativeCallable
/// -------------------------
/// Initializes [Pointer<mpv_handle>] & notifies about events through the supplied callback.
///
/// {@endtemplate}
class InitializerNativeCallable {
  /// Singleton instance.
  static InitializerNativeCallable? _instance;

  /// {@macro initializer}
  InitializerNativeCallable._(this.mpv);

  /// {@macro initializer}
  factory InitializerNativeCallable(generated.MPV mpv) {
    _instance ??= InitializerNativeCallable._(mpv);
    return _instance!;
  }

  /// Generated libmpv C API bindings.
  final generated.MPV mpv;

  /// Creates [Pointer<mpv_handle>].
  Future<Pointer<generated.mpv_handle>> create(
    Future<void> Function(Pointer<generated.mpv_event>) callback, {
    Map<String, String> options = const {},
  }) async {
    final ctx = mpv.mpv_create();
    for (final entry in options.entries) {
      final name = entry.key.toNativeUtf8();
      final value = entry.value.toNativeUtf8();
      mpv.mpv_set_option_string(ctx, name.cast(), value.cast());
      calloc.free(name);
      calloc.free(value);
    }
    mpv.mpv_initialize(ctx);
    final nativeCallable = WakeUpNativeCallable.listener(_callback);
    final nativeFunction = nativeCallable.nativeFunction;
    _locks[ctx.address] = Lock();
    _eventCallbacks[ctx.address] = callback;
    _wakeUpNativeCallables[ctx.address] = nativeCallable;
    mpv.mpv_set_wakeup_callback(ctx, nativeFunction.cast(), ctx.cast());
    return ctx;
  }

  /// Disposes [Pointer<mpv_handle>].
  void dispose(Pointer<generated.mpv_handle> ctx) {
    _locks.remove(ctx.address);
    _eventCallbacks.remove(ctx.address);
    _wakeUpNativeCallables.remove(ctx.address)?.close();
  }

  void _callback(Pointer<generated.mpv_handle> ctx) {
    _locks[ctx.address]?.synchronized(() async {
      while (true) {
        final event = mpv.mpv_wait_event(ctx, 0);
        if (event == nullptr) return;
        if (event.ref.event_id == generated.mpv_event_id.MPV_EVENT_NONE) return;
        await _eventCallbacks[ctx.address]?.call(event);
      }
    });
  }

  final _locks = HashMap<int, Lock>();
  final _eventCallbacks = EventCallbackMap();
  final _wakeUpNativeCallables = WakeUpNativeCallableMap();
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef WakeUpCallback = Void Function(Pointer<generated.mpv_handle>);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef WakeUpNativeCallable = NativeCallable<WakeUpCallback>;

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef WakeUpNativeCallableMap = HashMap<int, WakeUpNativeCallable>;

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef EventCallback = Future<void> Function(Pointer<generated.mpv_event>);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef EventCallbackMap = HashMap<int, EventCallback>;
