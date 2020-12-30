import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:quote_app/pages/quoteList.dart';
import 'package:quote_app/services/quotes.dart';
import 'package:quote_app/services/getquotes.dart';

class AllRandomQuotes extends StatefulWidget {
  @override
  _AllRandomQuotesState createState() => _AllRandomQuotesState();
}

class _AllRandomQuotesState extends State<AllRandomQuotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Random Quotes'),
          centerTitle: true,
          backgroundColor: Colors.black54 ,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/skydark.jpg'),
            fit: BoxFit.cover,
          )),
          child: FutureBuilder<List<Quotes>>(
            future: fetchQuotess(Client(),'quotes'),
            builder: (context, snapshot) {            
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? QuotesList(quotes: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        )
      );
  }
}