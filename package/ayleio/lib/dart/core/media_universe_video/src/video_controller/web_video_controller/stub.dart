/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'package:ayleio/dart/core/media_universe/media_kit_fork.dart';

import 'package:ayleio/dart/core/media_universe_video/src/video_controller/platform_video_controller.dart';

// Stub declaration for avoiding compilation errors on Dart Native using conditional imports.

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class WebVideoController extends PlatformVideoController {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static const bool supported = false;

  WebVideoController._(super.player, super.configuration);

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static Future<PlatformVideoController> create(
    Player player,
    VideoControllerConfiguration configuration,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<void> setSize({int? width, int? height}) => throw UnimplementedError();
}
