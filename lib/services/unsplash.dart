import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

Future<Response> fetchUnsplash() async {
  final response = await get(
    'https://api.unsplash.com/photos/random',
    // Send authorization headers to the backend.
    headers: {
      HttpHeaders.authorizationHeader:
          "Client-ID NkOaEiMDmwFdbg0-xWPxJUCRzGCJyjbt-IshxqMBaYI"
    },
  );
  Map data = jsonDecode(response.body);
  print(data);
}
