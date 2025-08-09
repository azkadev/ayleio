/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'package:meta/meta.dart';

import 'package:ayleio/dart/core/media_universe/src/player/platform_player.dart';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
void nativeEnsureInitialized({String? libmpv}) {}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class NativePlayer extends PlatformPlayer {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  NativePlayer({required super.configuration});

  /// Whether the [NativePlayer] is initialized for unit-testing.
  @visibleForTesting
  static bool test = false;

  /// The methods which must execute synchronously before playback of a source can begin.
  final List<Future<void> Function()> onLoadHooks = [];

  /// The methods which must execute synchronously before playback of a source can end.
  final List<Future<void> Function()> onUnloadHooks = [];
}
