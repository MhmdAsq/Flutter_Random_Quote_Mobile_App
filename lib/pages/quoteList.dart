import 'package:flutter/material.dart';
import 'package:quote_app/services/quotes.dart';
import 'package:flutter/services.dart';

class QuotesList extends StatelessWidget {
  final List<Quotes> quotes;

  QuotesList({Key key, this.quotes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return ListTile(
                title: Text(
                  '"${quotes[index].quote}"',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Colors.white
                    
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton.icon(
                      onPressed: (){
                        Clipboard.setData(
                          new ClipboardData(text: '"${quotes[index].quote}"' +' ~${quotes[index].author}' )).then((value){
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Quote copied to clipboard")));
                          });
                      }, 
                      icon: Icon(
                        Icons.copy,
                        color: Colors.white,
                      ), 
                      label: Text(
                        'copy',
                        style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        color: Colors.white
                        
                          ),
                      ),
                    ),
                    Text(
                      '~${quotes[index].author}',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        color: Colors.white
                        
                      ),
                    ),
                  ],
                ),
          );
        },
      ),
    );
  }
}