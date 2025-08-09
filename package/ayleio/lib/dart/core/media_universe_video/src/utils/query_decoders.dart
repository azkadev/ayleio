/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

// import 'dart:ffi';
import 'dart:ffi';

import 'dart:collection';
import 'package:ayleio/package/synchronized/lib/synchronized.dart';
// ignore_for_file: unused_import, implementation_imports
import 'package:ayleio/dart/core/media_universe/ffi/ffi.dart';
import 'package:ayleio/dart/core/media_universe/src/player/native/core/native_library.dart';

import 'package:ayleio/dart/core/media_universe/generated/libmpv/bindings.dart';

/// Returns the list of available decoders available in libavcodec.
/// Takes raw address to `mpv_handle*` as [handle].
///
/// https://mpv.io/manual/stable/#command-interface-decoder-list
Future<HashSet<String>> queryDecoders(int handle) {
  return _lock.synchronized(() {
    if (_decoders.isNotEmpty) {
      return _decoders;
    }

    NativeLibrary.ensureInitialized();
    final mpv = MPV(DynamicLibrary.open(NativeLibrary.path));

    if (_decoders.isEmpty) {
      final name = 'decoder-list'.toNativeUtf8();
      final data = calloc<mpv_node>();
      mpv.mpv_get_property(
        Pointer.fromAddress(handle),
        name.cast(),
        mpv_format.MPV_FORMAT_NODE,
        data.cast(),
      );
      if (data.ref.format == mpv_format.MPV_FORMAT_NODE_ARRAY) {
        for (int i = 0; i < data.ref.u.list.ref.num; i++) {
          final decoder = data.ref.u.list.ref.values[i];
          if (decoder.format == mpv_format.MPV_FORMAT_NODE_MAP) {
            String? name;
            for (int j = 0; j < decoder.u.list.ref.num; j++) {
              final k = decoder.u.list.ref.keys[j].cast<Utf8>().toDartString();
              final v = decoder.u.list.ref.values[j];
              if (k == 'codec' && v.format == mpv_format.MPV_FORMAT_STRING) {
                name ??= v.u.string.cast<Utf8>().toDartString();
              }
              if (k == 'driver' && v.format == mpv_format.MPV_FORMAT_STRING) {
                name ??= v.u.string.cast<Utf8>().toDartString();
              }
            }
            if (name != null) {
              _decoders.add(name);
            }
          }
        }
      }
      mpv.mpv_free_node_contents(data);
      calloc.free(name);
      calloc.free(data);
    }

    return _decoders;
  });
}

final Lock _lock = Lock();
final HashSet<String> _decoders = HashSet<String>();
