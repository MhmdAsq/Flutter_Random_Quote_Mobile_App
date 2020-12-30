import 'package:flutter/material.dart';
import 'package:quote_app/pages/all_random_quotes.dart';
import 'package:quote_app/pages/home.dart';
import 'package:quote_app/pages/loading.dart';
import 'package:quote_app/pages/random_quote.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/allquotes' : (context) => AllRandomQuotes(),
      '/randomquote' : (context) => RandomQuote(),
    },
  ));
}
