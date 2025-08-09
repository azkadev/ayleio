/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

/// {@template player_log}
///
/// PlayerLog
/// ---------
///
/// A log message sent by the libmpv backend.
///
/// {@endtemplate}
class PlayerLog {
  /// The sender of the message.
  final String prefix;

  /// The log level.
  final String level;

  /// The log message.
  final String text;

  /// {@macro player_log}
  const PlayerLog({
    required this.prefix,
    required this.level,
    required this.text,
  });

  @override
  String toString() => 'PlayerLog(prefix: $prefix, level: $level, text: $text)';
}
