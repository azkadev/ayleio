/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:ayleio/dart/core/media_universe_video/media_kit_video_fork.dart';
import 'package:ayleio/dart/core/media_universe_video/src/utils/dispose_safe_notifer.dart';
// import 'package:ayleio/dart/core/media_universe_video/src/video/video.dart';

/// {@template video_state_inherited_widget}
///
/// Inherited widget which provides [VideoState] associated with the parent [Video] widget to descendant widgets.
///
/// {@endtemplate}
class VideoStateInheritedWidget extends InheritedWidget {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final VideoState state;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final DisposeSafeNotifier<BuildContext?> contextNotifier;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final ValueNotifier<VideoViewParameters> videoViewParametersNotifier;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final bool disposeNotifiers;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  VideoStateInheritedWidget({
    super.key,
    required this.state,
    required this.contextNotifier,
    required this.videoViewParametersNotifier,
    required Widget child,
    this.disposeNotifiers = true,
  }) : super(
          child: VideoStateInheritedWidgetContextNotifier(
            state: state,
            contextNotifier: contextNotifier,
            videoViewParametersNotifier: videoViewParametersNotifier,
            disposeNotifiers: disposeNotifiers,
            child: child,
          ),
        );

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static VideoStateInheritedWidget? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoStateInheritedWidget>();
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static VideoStateInheritedWidget of(BuildContext context) {
    final VideoStateInheritedWidget? result = maybeOf(context);
    assert(result != null, 'No [VideoStateInheritedWidget] found in [context]');
    return result!;
  }

  @override
  bool updateShouldNotify(VideoStateInheritedWidget oldWidget) =>
      identical(state, oldWidget.state) &&
      identical(contextNotifier, oldWidget.contextNotifier);
}

/// {@template video_state_inherited_widget_context_notifier}
///
/// This widget is used to notify the [VideoState._contextNotifier] about the most recent [BuildContext] associated with the [Video] widget.
///
/// {@endtemplate}
class VideoStateInheritedWidgetContextNotifier extends StatefulWidget {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final VideoState state;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final DisposeSafeNotifier<BuildContext?> contextNotifier;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final ValueNotifier<VideoViewParameters?> videoViewParametersNotifier;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final bool disposeNotifiers;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final Widget child;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  const VideoStateInheritedWidgetContextNotifier({
    super.key,
    required this.state,
    required this.contextNotifier,
    required this.videoViewParametersNotifier,
    required this.disposeNotifiers,
    required this.child,
  });

  @override
  State<VideoStateInheritedWidgetContextNotifier> createState() =>
      VideoStateInheritedWidgetContextNotifierState();
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class VideoStateInheritedWidgetContextNotifierState
    extends State<VideoStateInheritedWidgetContextNotifier> {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static final fallback = HashMap<VideoState, BuildContext>.identity();

  @override
  void dispose() {
    if (!widget.contextNotifier.disposed) {
      // Restore the original [BuildContext] associated with this [Video] widget.
      widget.contextNotifier.value = fallback[widget.state];
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Only update the [BuildContext] associated with this [Video] widget if it is not already set or if the [Video] widget is in fullscreen mode.
    // This is being done because the [Video] widget is rebuilt when it enters/exits fullscreen mode... & things don't work properly if we let [BuildContext] update in every rebuild.
    if (widget.contextNotifier.value == null || isFullscreen(context)) {
      widget.contextNotifier.value = context;
      fallback[widget.state] ??= context;
    }

    return widget.child;
  }
}
