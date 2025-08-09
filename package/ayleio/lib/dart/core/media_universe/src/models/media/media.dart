/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

export 'media_native.dart' if (dart.library.js_interop) 'media_web.dart';
// if (dart.library.js) 'media_web.dart'if (dart.library.html) 'media_web.dart';

// export 'media_web.dart';
