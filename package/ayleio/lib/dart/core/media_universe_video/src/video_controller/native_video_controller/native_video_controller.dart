/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

export 'real.dart'
    if (dart.library.html) 'stub.dart'
    if (dart.library.js) 'stub.dart'
    if (dart.library.js_interop) 'stub.dart';
// /
//
// export "stub.dart";
