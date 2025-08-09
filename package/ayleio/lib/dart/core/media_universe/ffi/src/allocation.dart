// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: constant_identifier_names

import 'dart:ffi';
import 'dart:io'; 

// Note that kernel32.dll is the correct name in both 32-bit and 64-bit.
/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
final DynamicLibrary stdlib = Platform.isWindows
    ? DynamicLibrary.open('kernel32.dll')
    : DynamicLibrary.process();

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef PosixMallocNative = Pointer Function(IntPtr);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef PosixMalloc = Pointer Function(int);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
final PosixMalloc posixMalloc =
    stdlib.lookupFunction<PosixMallocNative, PosixMalloc>('malloc');

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef PosixCallocNative = Pointer Function(IntPtr num, IntPtr size);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef PosixCalloc = Pointer Function(int num, int size);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
final PosixCalloc posixCalloc =
    stdlib.lookupFunction<PosixCallocNative, PosixCalloc>('calloc');

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef PosixFreeNative = Void Function(Pointer);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef PosixFree = void Function(Pointer);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
final PosixFree posixFree =
    stdlib.lookupFunction<PosixFreeNative, PosixFree>('free');

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef WinGetProcessHeapFn = Pointer Function();

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
final WinGetProcessHeapFn winGetProcessHeap = stdlib
    .lookupFunction<WinGetProcessHeapFn, WinGetProcessHeapFn>('GetProcessHeap');

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
final Pointer processHeap = winGetProcessHeap();

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef WinHeapAllocNative = Pointer Function(Pointer, Uint32, IntPtr);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef WinHeapAlloc = Pointer Function(Pointer, int, int);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
final WinHeapAlloc winHeapAlloc =
    stdlib.lookupFunction<WinHeapAllocNative, WinHeapAlloc>('HeapAlloc');

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef WinHeapFreeNative = Int32 Function(
  Pointer heap,
  Uint32 flags,
  Pointer memory,
);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
typedef WinHeapFree = int Function(Pointer heap, int flags, Pointer memory);

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
final WinHeapFree winHeapFree =
    stdlib.lookupFunction<WinHeapFreeNative, WinHeapFree>('HeapFree');

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
const int HEAP_ZERO_MEMORY = 8;

/// Manages memory on the native heap.
///
/// Does not initialize newly allocated memory to zero. Use [_CallocAllocator]
/// for zero-initialized memory on allocation.
///
/// For POSIX-based systems, this uses `malloc` and `free`. On Windows, it uses
/// `HeapAlloc` and `HeapFree` against the default public heap.
class _MallocAllocator implements Allocator {
  const _MallocAllocator();

  /// Allocates [byteCount] bytes of of unitialized memory on the native heap.
  ///
  /// For POSIX-based systems, this uses `malloc`. On Windows, it uses
  /// `HeapAlloc` against the default public heap.
  ///
  /// Throws an [ArgumentError] if the number of bytes or alignment cannot be
  /// satisfied.
  @override
  Pointer<T> allocate<T extends NativeType>(int byteCount, {int? alignment}) {
    Pointer<T> result;
    if (Platform.isWindows) {
      result = winHeapAlloc(processHeap, /*flags=*/ 0, byteCount).cast();
    } else {
      result = posixMalloc(byteCount).cast();
    }
    if (result.address == 0) {
      throw ArgumentError('Could not allocate $byteCount bytes.');
    }
    return result;
  }

  /// Releases memory allocated on the native heap.
  ///
  /// For POSIX-based systems, this uses `free`. On Windows, it uses `HeapFree`
  /// against the default public heap. It may only be used against pointers
  /// allocated in a manner equivalent to [allocate].
  ///
  /// Throws an [ArgumentError] if the memory pointed to by [pointer] cannot be
  /// freed.
  ///
  @override
  void free(Pointer pointer) {
    if (Platform.isWindows) {
      if (winHeapFree(processHeap, /*flags=*/ 0, pointer) == 0) {
        throw ArgumentError('Could not free $pointer.');
      }
    } else {
      posixFree(pointer);
    }
  }
}

/// Manages memory on the native heap.
///
/// Does not initialize newly allocated memory to zero. Use [calloc] for
/// zero-initialized memory allocation.
///
/// For POSIX-based systems, this uses `malloc` and `free`. On Windows, it uses
/// `HeapAlloc` and `HeapFree` against the default public heap.
const Allocator malloc = _MallocAllocator();

/// Manages memory on the native heap.
///
/// Initializes newly allocated memory to zero.
///
/// For POSIX-based systems, this uses `calloc` and `free`. On Windows, it uses
/// `HeapAlloc` with [HEAP_ZERO_MEMORY] and `HeapFree` against the default
/// public heap.
class _CallocAllocator implements Allocator {
  const _CallocAllocator();

  /// Allocates [byteCount] bytes of zero-initialized of memory on the native
  /// heap.
  ///
  /// For POSIX-based systems, this uses `malloc`. On Windows, it uses
  /// `HeapAlloc` against the default public heap.
  ///
  /// Throws an [ArgumentError] if the number of bytes or alignment cannot be
  /// satisfied.
  @override
  Pointer<T> allocate<T extends NativeType>(int byteCount, {int? alignment}) {
    Pointer<T> result;
    if (Platform.isWindows) {
      result = winHeapAlloc(processHeap, /*flags=*/ HEAP_ZERO_MEMORY, byteCount)
          .cast();
    } else {
      result = posixCalloc(byteCount, 1).cast();
    }
    if (result.address == 0) {
      throw ArgumentError('Could not allocate $byteCount bytes.');
    }
    return result;
  }

  /// Releases memory allocated on the native heap.
  ///
  /// For POSIX-based systems, this uses `free`. On Windows, it uses `HeapFree`
  /// against the default public heap. It may only be used against pointers
  /// allocated in a manner equivalent to [allocate].
  ///
  /// Throws an [ArgumentError] if the memory pointed to by [pointer] cannot be
  /// freed.
  ///
  @override
  void free(Pointer pointer) {
    if (Platform.isWindows) {
      if (winHeapFree(processHeap, /*flags=*/ 0, pointer) == 0) {
        throw ArgumentError('Could not free $pointer.');
      }
    } else {
      posixFree(pointer);
    }
  }
}

/// Manages memory on the native heap.
///
/// Initializes newly allocated memory to zero. Use [malloc] for uninitialized
/// memory allocation.
///
/// For POSIX-based systems, this uses `calloc` and `free`. On Windows, it uses
/// `HeapAlloc` with [HEAP_ZERO_MEMORY] and `HeapFree` against the default
/// public heap.
const Allocator calloc = _CallocAllocator();
