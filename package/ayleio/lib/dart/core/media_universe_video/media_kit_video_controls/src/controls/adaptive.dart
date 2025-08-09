// /// This file is a part of .
// ///
// /// Copyright © 2021 & onwards,  <>.
// /// All rights reserved.
// /// Use of this source code is governed by MIT license that can be found in the LICENSE file.
// library;

// // ignore_for_file: non_constant_identifier_names
// import 'package:flutter/material.dart';
// import 'package:ayleio/dart/core/media_universe_video/media_kit_video_fork.dart';
// import 'package:ayleio/dart/core/media_universe_video/src/video/video.dart';

// /// {@template adaptive_video_controls}
// ///
// /// [Video] controls based on the running platform.
// ///
// /// {@endtemplate}
// Widget adaptiveVideoControlsFunction(VideoState state) {
//   switch (Theme.of(state.context).platform) {
//     case TargetPlatform.android:
//     case TargetPlatform.iOS:
//       return MaterialVideoControls(state);
//     case TargetPlatform.macOS:
//     case TargetPlatform.windows:
//     case TargetPlatform.linux:
//       return MaterialDesktopVideoControls(state);
//     default:
//       return NoVideoControls(state);
//   }
// }
