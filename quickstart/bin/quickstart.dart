
import 'dart:io';

import 'package:ayleio/core/core.dart' show Ayleio;
 

Future<String> ask({
  required String text,
}) async {
  while (true) {
    print("");

    stdout.write("${text}?: ");
    // print("${text}?: ");
    final String? input = stdin.readLineSync();
    if (input != null && input.trim().isNotEmpty) {
      return input.trim();
    }
  }
}

void main(List<String> args) async {
  print("start");
  final Ayleio ayleio = Ayleio();

  ayleio.ensureInitialized();

  // atur log menjadi 0
  // karena tidak mungkin akan log di production mode
  //
  ayleio.invokeSync({
    "@type": "setLogVerbosityLevel",
    "new_verbosity_level": 0,
  });

  ayleio.on("update", (Map update) async {
    print(update);
  });
 

  await ayleio.initialized();
  print("program started");
  final newClientId = ayleio.createClient();

  await ayleio.invoke({
    "@type": "getAuthorizationState",
    "@client_id": newClientId,
  });
}

