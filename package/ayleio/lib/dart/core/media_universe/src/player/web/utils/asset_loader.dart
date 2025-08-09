/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

import 'package:ayleio/dart/core/media_universe/src/values.dart';

/// {@template asset_loader}
///
/// AssetLoader
/// -----------
///
/// A utility to load Flutter assets.
///
/// {@endtemplate}
class AssetLoader {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static String load(String uri) {
    return encodeAssetKey(uri);
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static String encodeAssetKey(String uri) {
    String key = uri.split(_kAssetScheme).last;
    if (key.startsWith('/')) {
      key = key.substring(1);
    }

    // https://github.com/media-kit/media-kit/issues/531
    // https://github.com/media-kit/media-kit/issues/121
    if (kReleaseMode) {
      return 'assets/${key.split('/').map((e) => Uri.encodeComponent(Uri.encodeComponent(e))).join('/')}';
    }
    return key.split('/').map(Uri.encodeComponent).join('/');
  }

  /// URI scheme used to identify Flutter assets.
  static const String _kAssetScheme = 'asset://';
}
