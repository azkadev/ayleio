// ignore_for_file: empty_catches, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'package:ayleio/uuid/uuid.dart';

/// No Doc Azkadev
class Ayleio {
  bool _isInitialized = false;

  /// No Doc Azkadev
  String getLibraryExtension() {
    if (Platform.isMacOS || Platform.isIOS) {
      return "dylib";
    }
    if (Platform.isWindows) {
      return "dll";
    }
    return "so";
  }

  /// No Doc Azkadev
  String getNativeLibraryPath({
    String pathNativeLibrary = "",
  }) {
    if (pathNativeLibrary.isEmpty) {
      return "libayleio.${getLibraryExtension()}";
    }
    return pathNativeLibrary;
  }

  /// No Doc Azkadev
  void ensureInitialized({
    String pathNativeLibrary = "",
  }) {}

  /// No Doc Azkadev

  Future<void> initialized() async {
    if (_isInitialized) {
      return;
    }
    _isInitialized = true;
    nativeLibraryInvokeRaw({
      "@type": "initialized",
    });

    /// menutup semua client
    /// ini sangat berguna karena pada dasrnya
    /// ketika load library dan kamu debug di flutter
    /// maka memori library tidak auto hilang
    /// itu tandanya hanya program dart yang di restart dan memorinya yang hilang
    /// maka jika tidak demikian
    /// ketika kamu membuat client lagi maka tidak bisa akan error
    ///
    nativeLibraryInvokeRaw({
      "@type": "closeClients",
    });
  }

  /// No Doc Azkadev
  Map nativeLibraryInvokeRaw(Map parameters) {
    final parametersNative =
        json.encode(parameters).toNativeUtf8().cast<Char>();
    final resultNative = parametersNative;
    return json.decode(resultNative.cast<Utf8>().toDartString());
  }

  /// untuk membuat client nativeLibrary
  ///
  /// hasil akan urut mulai dari 1,2,3,4 seterusnya
  int createClient() {
    final result = nativeLibraryInvokeRaw({
      "@type": "createClient",
    });
    return result["client_id"];
  }

  /// untuk invoke nativeLibrary sync
  /// tidak semua method bisa hanya beberapa method
  Map invokeSync(Map parameters) {
    parameters["@is_sync"] = true;
    return nativeLibraryInvokeRaw(parameters);
  }

  /// untuk invoke nativeLibrary sync
  /// memanggil segala jenis api ini inti program
  /// sehingga kamu tidak perlu menunggu saya update karena kamu hanya perlu compile
  /// nativeLibrary jadi semua method bisa di panggil seperti biasa
  Future<Map> invoke(Map parameters) async {
    final int client_id = switch (parameters["@client_id"]) {
      num value => value.toInt(),
      Object() => 0,
      null => 0,
    };
    if (client_id < 1) {
      return {
        "@type": "error",
        "message": "special_client_id_bad_format",
      };
    }
    final String extra = switch (parameters["@extra"]) {
      String value => value,
      Object() => "${client_id}_1754639695024_${generateUuidAzkadev(10)}",
      null => "${client_id}_1754639695024_${generateUuidAzkadev(10)}",
    };
    parameters["@extra"] = extra;
    parameters["@is_async"] = true;
    nativeLibraryInvokeRaw(parameters);
    // final result = await completer.future;
    return {
      "@type": "ok",
    };
  }
}
