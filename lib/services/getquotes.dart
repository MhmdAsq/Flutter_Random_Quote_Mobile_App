import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'quotes.dart';

Future<List<Quotes>> fetchQuotess(Client client,String url) async {
  final response =
      await client.get('https://zenquotes.io/api/$url');

  // Use the compute function to run parseQuotess in a separate isolate.
  return compute(parseQuotess, response.body);
}

  // A function that converts a response body into a List<Quotes>.
List<Quotes> parseQuotess(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Quotes>((json) => Quotes.fromJson(json)).toList();
}


