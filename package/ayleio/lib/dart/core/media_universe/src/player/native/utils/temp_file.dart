/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'dart:io';
import 'package:ayleio/uuid/uuid.dart';
import 'package:path/path.dart';
import 'package:ayleio/package/safe_local_storage/lib/safe_local_storage.dart';
// import 'package:uuid/uuid.dart';

import 'package:ayleio/dart/core/media_universe/src/player/native/utils/android_helper.dart';

/// {@template temp_file}
///
/// TempFile
/// --------
/// A simple class to create temporary files.
///
/// {@endtemplate}
abstract class TempFile {
  /// The directory used to create temporary files.
  static String get directory {
    String? result;
    if (Platform.isWindows) {
      result = Directory.systemTemp.path;
    } else if (Platform.isLinux) {
      result = Directory.systemTemp.path;
    } else if (Platform.isMacOS) {
      result = Directory.systemTemp.path;
    } else if (Platform.isIOS) {
      result = Directory.systemTemp.path;
    } else if (Platform.isAndroid) {
      result = AndroidHelper.filesDir;
    }
    if (result != null) {
      return result;
    }
    throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
  }

  /// Creates a temporary file & returns it.
  static Future<File> create() async {
    final file = File(
      join(
        directory,
        generateUuidAzkadev(10),
      ),
    );
    await file.create_();
    return file;
  }
}
