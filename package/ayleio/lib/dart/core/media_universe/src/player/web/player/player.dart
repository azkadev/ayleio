/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

export 'stub.dart' if (dart.library.js_interop) 'real.dart';
//  if (dart.library.js) 'real.dart' if (dart.library.html) 'real.dart';
