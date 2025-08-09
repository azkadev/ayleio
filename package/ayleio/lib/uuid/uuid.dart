import 'dart:math';

/// General Library Documentation Undocument By General Corporation & Global Corporation & General Developer
String generateUuidAzkadev(
  int length, {
  String text = "0123456789abcdefghijklmnopqrstuvwxyz",
}) {
  return List.generate(length, (index) {
    final String dataText = text[Random().nextInt(text.length)];
    return dataText;
  }).join("");
}
