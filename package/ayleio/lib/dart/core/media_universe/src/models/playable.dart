/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

// A marker interface for accepting both [Media] and [Playlist] in [Player.open].

/// {@template playable}
///
/// Playable
/// --------
///
/// A playable item in [Player]. It can be [Media] or [Playlist].
///
/// {@endtemplate}
abstract class Playable {
  /// {@macro playable}
  const Playable();
}
