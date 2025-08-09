/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

// import 'package:general_universe/dart/dart.dart' show Dart;

import 'dart:io';

import 'package:ayleio/dart/core/media_universe/src/player/native/player/player.dart';
 
/// {@template media_kit_fork}
///
/// package:media_kit_fork
/// -----------------
/// A complete video & audio library for Flutter & Dart.
///
/// {@endtemplate}
abstract class MediaKit {
  static bool _initialized = false;

  /// {@macro media_kit_fork}
  static void ensureInitialized({String? libmpv}) {
    if (_initialized) return;

    try {
       if (Platform.isWindows) {
        nativeEnsureInitialized(libmpv: libmpv);
      } else if (Platform.isLinux) {
        nativeEnsureInitialized(libmpv: libmpv);
      } else if (Platform.isMacOS) {
        nativeEnsureInitialized(libmpv: libmpv);
      } else if (Platform.isIOS) {
        nativeEnsureInitialized(libmpv: libmpv);
      } else if (Platform.isAndroid) {
        nativeEnsureInitialized(libmpv: libmpv);
      }
      _initialized = true;
    } catch (_) {
      rethrow;
    }
  }
}
