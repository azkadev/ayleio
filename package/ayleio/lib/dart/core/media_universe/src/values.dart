/// This file is a part of .
///
/// Copyright © 2021 & onwards,  <>.
/// All rights reserved.
/// Use of this source code is governed by MIT license that can be found in the LICENSE file.
library;

/// A constant that is true if the application was compiled in release mode.
const bool kReleaseMode = bool.fromEnvironment('dart.vm.product');

/// A constant that is true if the application was compiled in profile mode.
const bool kProfileMode = bool.fromEnvironment('dart.vm.profile');

/// A constant that is true if the application was compiled in debug mode.
const bool kDebugMode = !kReleaseMode && !kProfileMode;
