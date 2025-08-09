/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'package:flutter/widgets.dart';

import 'package:ayleio/dart/core/media_universe_video/media_kit_video_controls/src/controls/methods/video_state.dart';
import 'package:ayleio/dart/core/media_universe_video/src/video/video.dart';

/// {@template fullscreen_inherited_widget}
///
/// Inherited widget used to identify whether parent [Video] is in fullscreen or not.
///
/// {@endtemplate}
class FullscreenInheritedWidget extends InheritedWidget {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final VideoState parent;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  FullscreenInheritedWidget({
    super.key,
    required this.parent,
    required Widget child,
  }) : super(child: _FullscreenInheritedWidgetPopScope(child: child));

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static FullscreenInheritedWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FullscreenInheritedWidget>();
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static FullscreenInheritedWidget of(BuildContext context) {
    final FullscreenInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No [FullscreenInheritedWidget] found in [context]');
    return result!;
  }

  @override
  bool updateShouldNotify(FullscreenInheritedWidget oldWidget) => identical(parent, oldWidget.parent);
}

/// {@template fullscreen_inherited_widget_pop_scope}
///
/// This widget is used to exit native fullscreen when this route is popped from the navigator.
///
/// {@endtemplate}
class _FullscreenInheritedWidgetPopScope extends StatefulWidget {
  final Widget child;
  const _FullscreenInheritedWidgetPopScope({required this.child});

  @override
  State<_FullscreenInheritedWidgetPopScope> createState() => _FullscreenInheritedWidgetPopScopeState();
}

class _FullscreenInheritedWidgetPopScopeState extends State<_FullscreenInheritedWidgetPopScope> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Make sure to exit native fullscreen when this route is popped from the navigator.
        await onExitFullscreen(context)?.call();
        return true;
      },
      child: widget.child,
    );
  }
}
