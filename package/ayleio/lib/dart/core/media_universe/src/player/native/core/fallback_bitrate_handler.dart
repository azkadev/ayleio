/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'dart:io';
import 'package:ayleio/package/uri_parser/lib/uri_parser.dart';
import 'package:ayleio/package/safe_local_storage/lib/safe_local_storage.dart';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
abstract class FallbackBitrateHandler {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static bool supported(String uri) => extractFilePath(uri) != null;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static String? extractFilePath(String uri) {
    try {
      final parser = URIParser(uri);
      final formats = ['AAC', 'M4A', 'OGG', 'OPUS', 'FLAC'];
      if (parser.type == URIType.file &&
          formats.contains(parser.file!.extension)) {
        return parser.file!.path;
      }
    } catch (_) {}
    return null;
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static Future<double> calculateBitrate(String uri, Duration duration) async {
    try {
      final filePath = extractFilePath(uri);
      if (filePath != null) {
        final file = File(filePath);
        final length = await file.length_();
        final result = length * 8 / duration.inSeconds;
        return result;
      }
    } catch (_) {}
    return 0;
  }
}
