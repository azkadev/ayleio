/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

// ignore_for_file: non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:ayleio/dart/core/media_universe_video/media_kit_video_fork.dart';
// import 'package:ayleio/dart/core/media_universe_video/src/video/video.dart';

import 'package:ayleio/dart/core/media_universe_video/media_kit_video_controls/src/controls/widgets/video_controls_theme_data_injector.dart';

/// {@template cupertino_video_controls}
///
/// [Video] controls which use Cupertino design.
///
/// {@endtemplate}
Widget CupertinoVideoControls(VideoState state) {
  return const VideoControlsThemeDataInjector(child: _CupertinoVideoControls());
}

/// [MaterialDesktopVideoControlsThemeData] available in this [context].
// CupertinoVideoControlsThemeData _theme(BuildContext context) =>
//     FullscreenInheritedWidget.maybeOf(context) == null
//         ? CupertinoVideoControlsTheme.maybeOf(context)?.normal ??
//             kDefaultCupertinoVideoControlsThemeData
//         : CupertinoVideoControlsTheme.maybeOf(context)?.fullscreen ??
//             kDefaultCupertinoVideoControlsThemeDataFullscreen;

/// Default [CupertinoVideoControlsThemeData].
const kDefaultCupertinoVideoControlsThemeData =
    CupertinoVideoControlsThemeData();

/// Default [CupertinoVideoControlsThemeData] for fullscreen.
const kDefaultCupertinoVideoControlsThemeDataFullscreen =
    CupertinoVideoControlsThemeData();

/// {@template cupertino_video_controls_theme_data}
///
/// Theming related data for [CupertinoVideoControls]. These values are used to theme the descendant [CupertinoVideoControls].
///
/// {@endtemplate}
class CupertinoVideoControlsThemeData {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  const CupertinoVideoControlsThemeData();
}

/// {@template cupertino_video_controls_theme}
///
/// Inherited widget which provides [CupertinoVideoControlsThemeData] to descendant widgets.
///
/// {@endtemplate}
class CupertinoVideoControlsTheme extends InheritedWidget {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final CupertinoVideoControlsThemeData normal;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final CupertinoVideoControlsThemeData fullscreen;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  const CupertinoVideoControlsTheme({
    super.key,
    required this.normal,
    required this.fullscreen,
    required super.child,
  });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static CupertinoVideoControlsTheme? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CupertinoVideoControlsTheme>();
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static CupertinoVideoControlsTheme of(BuildContext context) {
    final CupertinoVideoControlsTheme? result = maybeOf(context);
    assert(
      result != null,
      'No [CupertinoVideoControlsTheme] found in [context]',
    );
    return result!;
  }

  @override
  bool updateShouldNotify(CupertinoVideoControlsTheme oldWidget) =>
      identical(normal, oldWidget.normal) &&
      identical(fullscreen, oldWidget.fullscreen);
}

/// {@macro cupertino_video_controls}
class _CupertinoVideoControls extends StatefulWidget {
  const _CupertinoVideoControls();

  @override
  State<_CupertinoVideoControls> createState() =>
      _CupertinoVideoControlsState();
}

/// {@macro cupertino_video_controls}
class _CupertinoVideoControlsState extends State<_CupertinoVideoControls> {
  @override
  Widget build(BuildContext context) {
    // TODO: Missing implementation.
    return Container();
  }
}
