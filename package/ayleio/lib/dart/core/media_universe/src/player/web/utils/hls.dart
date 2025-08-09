/// This file is a part of .
///
/// Copyright © 2021 & onwards, WanJiMi.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
// ignore_for_file: empty_catches

library;

import 'dart:async';
import 'dart:js_interop';
import 'package:web/web.dart' as web;
import 'package:ayleio/package/synchronized/lib/synchronized.dart';

// --------------------------------------------------

/// {@template hls}
///
/// HLS
/// ---
///
/// Adds [HLS.js](https://github.com/video-dev/hls.js/) to the HTML document using [web.HTMLScriptElement].
///
/// {@endtemplate}
abstract class HLS {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static Future<void> ensureInitialized({String? hls}) {
    return _lock.synchronized(() async {
      if (_initialized) {
        return;
      }
      final completer = Completer();
      try {
        final script = web.HTMLScriptElement()
          ..async = true
          ..charset = 'utf-8'
          ..type = 'text/javascript'
          ..src = hls ?? kHLSAsset;

        script.onLoad.listen((_) {
          if (!completer.isCompleted) {
            completer.complete();
          }
        });
        script.onError.listen((_) {
          if (!completer.isCompleted) {
            completer.completeError(Exception('Failed to load HLS.js'));
          }
        });

        web.HTMLHeadElement? head = web.document.head;
        if (head == null) {
          head = web.HTMLHeadElement();
          web.document.append(head);
        }
        head.append(script);
      } catch (_) {
        if (!completer.isCompleted) {
          completer.completeError(Exception('Failed to load HLS.js'));
        }
      }
      try {
        await completer.future;
        _initialized = true;
      } catch (exception) {}
    });
  }

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  static String kHLSAsset = Uri.base.replace(
    pathSegments: [
      "assets",
      "packages",
      "media_universe_flutter",
      "assets",
      "web",
      "hls1.4.10.js",
    ],
  ).toString();

  // 'assets/packages/media_universe_flutter/assets/web/hls1.4.10.js';

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  // 'https://cdnjs.cloudflare.com/ajax/libs/hls.js/1.4.10/hls.js';

  static String kHLSCDN = Uri.base.replace(
    pathSegments: [
      "assets",
      "packages",
      "media_universe_flutter",
      "assets",
      "web",
      "hls1.4.10.js",
    ],
  ).toString();

  static final Lock _lock = Lock();
  static bool _initialized = false;
}

// --------------------------------------------------

@JS('Hls.isSupported')

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
external bool isHLSSupported();

@JS()
@staticInterop

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
abstract class XHRSetupCallback {}

extension on XHRSetupCallback {
  // ignore: unused_element
  external void call(web.XMLHttpRequest xhr, String url);
  // todo: is this even important? I am not familiar with this.
}

@JS()
@anonymous
@staticInterop

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class HlsOptions {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  external factory HlsOptions({XHRSetupCallback? xhrSetup});
}

@JS()
@staticInterop

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class Hls {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  external factory Hls(HlsOptions options);
}

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
extension ExtensionHls on Hls {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  external void loadSource(String src);

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  external void attachMedia(web.HTMLVideoElement video);
}

// --------------------------------------------------
