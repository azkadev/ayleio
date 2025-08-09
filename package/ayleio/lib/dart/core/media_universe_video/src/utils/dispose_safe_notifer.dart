import 'package:flutter/widgets.dart';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
class DisposeSafeNotifier<T> extends ValueNotifier<T> {
  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  bool disposed = false;

  /// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
  DisposeSafeNotifier(super.value);

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
