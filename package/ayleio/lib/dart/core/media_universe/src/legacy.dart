/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

// ignore_for_file: camel_case_types
import 'package:ayleio/dart/core/media_universe/src/player/native/player/player.dart';
import 'package:ayleio/dart/core/media_universe/src/player/web/player/player.dart';

// ----------------------------------------
// BACKWARD COMPATIBILITY
// ----------------------------------------

@Deprecated('Use [NativePlayer] instead')

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef libmpvPlayer = NativePlayer;

@Deprecated('Use [WebPlayer] instead')

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef webPlayer = WebPlayer;
