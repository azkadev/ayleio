/// This file is a part of .
///
/// Copyright © 2023 & onwards, .
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'dart:async';
import 'package:flutter/widgets.dart';

import 'package:ayleio/dart/core/media_universe_video/src/video/video.dart';
import 'package:ayleio/dart/core/media_universe_video/src/subtitle/subtitle_view.dart';

/// {@template video_view_parameters}
///
/// VideoViewParameters
/// -------------------
///
/// The attributes of a [Video] widget composed into a single class.
///
/// {@endtemplate}
class VideoViewParameters {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? width;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? height;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final BoxFit fit;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final Color fill;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final Alignment alignment;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final double? aspectRatio;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final FilterQuality filterQuality;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final /* VideoControlsBuilder? */ dynamic controls;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  final SubtitleViewConfiguration subtitleViewConfiguration;

  /// {@macro video_view_parameters}
  VideoViewParameters({
    required this.width,
    required this.height,
    required this.fit,
    required this.fill,
    required this.alignment,
    required this.aspectRatio,
    required this.filterQuality,
    required this.controls,
    required this.subtitleViewConfiguration,
  });

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  VideoViewParameters copyWith({
    double? width,
    double? height,
    BoxFit? fit,
    Color? fill,
    Alignment? alignment,
    double? aspectRatio,
    FilterQuality? filterQuality,
    /* VideoControlsBuilder? */ dynamic controls,
    bool? pauseUponEnteringBackgroundMode,
    bool? resumeUponEnteringForegroundMode,
    SubtitleViewConfiguration? subtitleViewConfiguration,
    Future<void> Function()? onEnterFullscreen,
    Future<void> Function()? onExitFullscreen,
  }) {
    return VideoViewParameters(
      width: width ?? this.width,
      height: height ?? this.height,
      fit: fit ?? this.fit,
      fill: fill ?? this.fill,
      alignment: alignment ?? this.alignment,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      filterQuality: filterQuality ?? this.filterQuality,
      controls: controls ?? this.controls,
      subtitleViewConfiguration:
          subtitleViewConfiguration ?? this.subtitleViewConfiguration,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoViewParameters &&
          other.width == width &&
          other.height == height &&
          other.fit == fit &&
          other.fill == fill &&
          other.alignment == alignment &&
          other.aspectRatio == aspectRatio &&
          other.filterQuality == filterQuality &&
          other.controls == controls &&
          other.subtitleViewConfiguration == subtitleViewConfiguration;

  @override
  int get hashCode =>
      width.hashCode ^
      height.hashCode ^
      fit.hashCode ^
      fill.hashCode ^
      alignment.hashCode ^
      aspectRatio.hashCode ^
      filterQuality.hashCode ^
      controls.hashCode ^
      subtitleViewConfiguration.hashCode;
}
