import 'dart:convert';
import 'package:http/http.dart';

class Quotes {
  String quote;
  String author;
  String tags;
  String url;

  Quotes({this.quote, this.author, this.tags, this.url});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(quote: json['q'], author: json['a'], tags: json['h']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q'] = this.quote;
    data['a'] = this.author;
    data['h'] = this.tags;
    return data;
  }

  Future<void> getQuote() async {
    try {
      Response response = await get('https://zenquotes.io/api/$url');
      List data = jsonDecode(response.body);
      Quotes.fromJson(data[0]);
      quote = data[0]['q'];
      author = data[0]['a'];
    } catch (e) {
      quote = "Check Your Network Connection";
      author = "Developers Community";
      print('caught Errors : $e');
    }
  }
}
