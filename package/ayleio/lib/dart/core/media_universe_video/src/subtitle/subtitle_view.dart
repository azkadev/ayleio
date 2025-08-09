/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
// ignore_for_file: empty_catches

library;

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:ayleio/dart/core/media_universe_video/src/video_controller/video_controller.dart';

/// SubtitleView
/// ------------
///
/// [SubtitleView] widget is used to display the subtitles on top of the [Video].
class SubtitleView extends StatefulWidget {
  /// The [VideoController] reference to control this [SubtitleView] output.
  final VideoController controller;

  /// The configuration to be used for the subtitles.
  final SubtitleViewConfiguration configuration;

  /// {@macro subtitle_view}
  const SubtitleView({
    super.key,
    required this.controller,
    required this.configuration,
  });

  @override
  SubtitleViewState createState() => SubtitleViewState();
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class SubtitleViewState extends State<SubtitleView> {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  late List<String> subtitle = widget.controller.player.state.subtitle;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  // late EdgeInsets padding = widget.configuration.padding;

  ValueNotifier<EdgeInsets> paddingNotifier = ValueNotifier(EdgeInsets.zero);

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  late Duration duration = const Duration(milliseconds: 100);

  // The [StreamSubscription] to listen to the subtitle changes.
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  StreamSubscription<List<String>>? subscription;

  // The reference width for calculating the visible text scale factor.
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static const kTextScaleFactorReferenceWidth = 1920.0;
  // The reference height for calculating the visible text scale factor.
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static const kTextScaleFactorReferenceHeight = 1080.0;

  @override
  void initState() {
    subscription = widget.controller.player.stream.subtitle.listen((value) {
      setState(() {
        subtitle = value;
      });
    });
    paddingNotifier.value = widget.configuration.padding;
    super.initState();
  }

  @override
  void dispose() {
    try {
      paddingNotifier.dispose();
    } catch (e) {}
    subscription?.cancel();

    super.dispose();
  }

  /// Sets the padding to be used for the subtitles.
  ///
  /// The [duration] argument may be specified to set the duration of the animation.
  void setPadding(
    EdgeInsets padding, {
    Duration duration = const Duration(milliseconds: 100),
  }) {
    if (this.duration != duration) {
      this.duration = duration;
    }
    paddingNotifier.value = padding;
  }

  /// {@macro subtitle_view}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the visible text scale factor.
        // ignore: deprecated_member_use
        final textScaleFactor = widget.configuration.textScaleFactor ??
            // ignore: deprecated_member_use
            MediaQuery.of(context).textScaleFactor *
                sqrt(
                  ((constraints.maxWidth * constraints.maxHeight) /
                          (kTextScaleFactorReferenceWidth *
                              kTextScaleFactorReferenceHeight))
                      .clamp(0.0, 1.0),
                );
        return Material(
          color: Colors.transparent,
          child: ListenableBuilder(
            listenable: paddingNotifier,
            builder: (context, child) {
              return AnimatedContainer(
                padding: paddingNotifier.value,
                // padding: padding,
                duration: duration,
                alignment: Alignment.bottomCenter,
                child: Text(
                  [
                    for (final line in subtitle)
                      if (line.trim().isNotEmpty) line.trim(),
                  ].join('\n'),
                  style: widget.configuration.style,
                  textAlign: widget.configuration.textAlign,
                  textScaler: TextScaler.linear(textScaleFactor),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/// {@template subtitle_view_configuration}
/// SubtitleViewConfiguration
/// -------------------------
///
/// Configurable options for customizing the [SubtitleView] behaviour.
/// {@endtemplate}
class SubtitleViewConfiguration {
  /// Whether the subtitles should be visible or not.
  final bool visible;

  /// The text style to be used for the subtitles.
  final TextStyle style;

  /// The text alignment to be used for the subtitles.
  final TextAlign textAlign;

  /// The text scale factor to be used for the subtitles.
  final double? textScaleFactor;

  /// The padding to be used for the subtitles.
  final EdgeInsets padding;

  /// {@macro subtitle_view_configuration}
  const SubtitleViewConfiguration({
    this.visible = true,
    this.style = const TextStyle(
      height: 1.4,
      fontSize: 32.0,
      letterSpacing: 0.0,
      wordSpacing: 0.0,
      color: Color(0xffffffff),
      fontWeight: FontWeight.normal,
      backgroundColor: Color(0xaa000000),
    ),
    this.textAlign = TextAlign.center,
    this.textScaleFactor,
    this.padding = const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
  });
}
