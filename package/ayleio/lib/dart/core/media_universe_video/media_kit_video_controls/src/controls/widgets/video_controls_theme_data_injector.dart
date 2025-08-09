/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'package:flutter/widgets.dart';

import 'package:ayleio/dart/core/media_universe_video/media_kit_video_controls/src/controls/cupertino.dart';
import 'package:ayleio/dart/core/media_universe_video/media_kit_video_controls/src/controls/material.dart';
import 'package:ayleio/dart/core/media_universe_video/media_kit_video_controls/src/controls/material_desktop.dart';

/// {@template video_controls_theme_data_injector}
///
/// VideoControlsThemeDataInjector
/// ------------------------------
///
/// Makes the various `*VideoControlsTheme` [InheritedWidget]s from provided [context] to current [BuildContext] and its descendants.
///
/// The fallback to default values is done by [VideoControlsThemeDataInjector] itself.
///
/// * [CupertinoVideoControlsTheme]
/// * [MaterialVideoControlsTheme]
/// * [MaterialDesktopVideoControlsTheme]
///
/// {@endtemplate}
class VideoControlsThemeDataInjector extends StatefulWidget {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final Widget child;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final BuildContext? context;

  /// {@macro video_controls_theme_data_injector}
  const VideoControlsThemeDataInjector({
    super.key,
    required this.child,
    this.context,
  });

  @override
  State<VideoControlsThemeDataInjector> createState() =>
      _VideoControlsThemeDataInjectorState();
}

class _VideoControlsThemeDataInjectorState
    extends State<VideoControlsThemeDataInjector> {
  late final builders = <Widget Function(Widget)>[
    // CupertinoVideoControlsTheme
    (child) {
      final theme =
          CupertinoVideoControlsTheme.maybeOf(widget.context ?? context);
      final normal = theme?.normal ?? kDefaultCupertinoVideoControlsThemeData;
      final fullscreen = theme?.fullscreen ??
          kDefaultCupertinoVideoControlsThemeDataFullscreen;
      return CupertinoVideoControlsTheme(
        normal: normal,
        fullscreen: fullscreen,
        child: child,
      );
    },
    // MaterialVideoControlsTheme
    (child) {
      final theme =
          MaterialVideoControlsTheme.maybeOf(widget.context ?? context);
      final normal = theme?.normal ?? kDefaultMaterialVideoControlsThemeData;
      final fullscreen =
          theme?.fullscreen ?? kDefaultMaterialVideoControlsThemeDataFullscreen;
      return MaterialVideoControlsTheme(
        normal: normal,
        fullscreen: fullscreen,
        child: child,
      );
    },
    // MaterialDesktopVideoControlsTheme
    (child) {
      final theme =
          MaterialDesktopVideoControlsTheme.maybeOf(widget.context ?? context);
      final normal =
          theme?.normal ?? kDefaultMaterialDesktopVideoControlsThemeData;
      final fullscreen = theme?.fullscreen ??
          kDefaultMaterialDesktopVideoControlsThemeDataFullscreen;
      return MaterialDesktopVideoControlsTheme(
        normal: normal,
        fullscreen: fullscreen,
        child: child,
      );
    },
    // NOTE: Add more builders if more *VideoControlsTheme are implemented.
  ];

  @override
  Widget build(BuildContext context) {
    return builders.fold<Widget>(
      widget.child,
      (child, builder) => builder(child),
    );
  }
}
