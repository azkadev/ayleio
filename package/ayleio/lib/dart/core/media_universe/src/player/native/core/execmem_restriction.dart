/// This file is a part of .
///
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;
// ignore_for_file: constant_identifier_names

// import 'dart:ffi';
import 'dart:ffi';
import 'dart:io';

/// Whether creating new anonymous executable memory mappings is blocked by the system.
final bool isExecmemRestricted = _checkIfExecmemRestricted();

/// Checks if creating new anonymous executable memory mappings is blocked by the system.
/// Only applies to Linux-based systems, since Dart doesn't use them for [NativeCallback]s on Fuchsia and Apple systems.
bool _checkIfExecmemRestricted() {
  if (Platform.isLinux || Platform.isAndroid) {
    try {
      final libs = DynamicLibrary.process();
      final mmap = libs.lookupFunction<MmapFunctionNative, MmapFunctionDart>(
        'mmap',
        isLeaf: true,
      );
      final munmap =
          libs.lookupFunction<MunmapFunctionNative, MunmapFunctionDart>(
        'munmap',
        isLeaf: true,
      );
      final mapping = mmap(
        nullptr,
        4096,
        PROT_READ | PROT_EXEC,
        MAP_PRIVATE | MAP_ANONYMOUS,
        -1,
        0,
      );
      if (mapping.address == MAP_FAILED) {
        // Mapping failed, most likely because of execmem restrictions.
        return true;
      }
      munmap(mapping, 4096);
    } catch (_) {}
  }
  return false;
}

// Constants sourced from Linux kernel headers.

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
const PROT_READ = 0x1;

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
const PROT_WRITE = 0x2;

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
const PROT_EXEC = 0x4;

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
const MAP_FAILED = -1;

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
const MAP_PRIVATE = 0x2;

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
const MAP_ANONYMOUS = 0x20;

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef MmapFunctionNative = Pointer<Void> Function(
  Pointer<Void>,
  Size,
  Int32,
  Int32,
  Int32,
  Long,
);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef MmapFunctionDart = Pointer<Void> Function(
  Pointer<Void>,
  int,
  int,
  int,
  int,
  int,
);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef MunmapFunctionNative = Int32 Function(Pointer<Void>, Size);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef MunmapFunctionDart = int Function(Pointer<Void>, int);
