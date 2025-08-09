
const _isRunningWithWasm = bool.fromEnvironment('dart.tool.dart2wasm');


class AyleioUtils {
  /// GeneralUniverse
  static bool get isWasm => _isRunningWithWasm;

  /// GeneralUniverse
  static bool get isWeb =>
      const bool.fromEnvironment('dart.library.html') ||
      const bool.fromEnvironment('dart.library.js_util') ||
      const bool.fromEnvironment('dart.library.js') ||
      const bool.fromEnvironment('dart.library.js_interop') ||
      isWasm;
  
}