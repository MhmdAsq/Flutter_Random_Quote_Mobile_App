import 'package:flutter/material.dart';

class RandomQuote extends StatefulWidget {
  @override
  _RandomQuoteState createState() => _RandomQuoteState();
}

class _RandomQuoteState extends State<RandomQuote> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
  data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments ;
    return Scaffold(
      backgroundColor: Colors.grey[400] ,
        appBar: AppBar(
          title: Text('Quote of the Secound'),
          centerTitle: true,
          backgroundColor: Colors.black54 ,
        ),
        
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/dark1.jpg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 200, 15, 10),
            child: Center(
              child: Column(
                children : [
                  Text(
                    '"'+data['quote']+'"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 22,
                      color: Colors.white
                      
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '~'+data['author'],
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: Colors.white
                    ),
                  ),
                ]
              ),
            ),
          ),
        ),
    );
  }
}