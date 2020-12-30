import 'package:flutter/material.dart';
import 'package:quote_app/services/connectivity.dart';
import 'package:quote_app/services/quotes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  void quotes() async {
      Quotes instance = Quotes(url: 'random');
      await instance.getQuote();
      Navigator.pushNamed(context, '/randomquote',
          arguments: {'quote': instance.quote, 'author': instance.author});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/dark.jpg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 150, 15, 10),
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          '!! Quote Of The Day !!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Text(
                          '"' + data['quote'] + '"',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          '~' + data['author'],
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: RaisedButton.icon(
                          color: Colors.black87,
                          textColor: Colors.white70,
                          onPressed: () async {
                            await Navigator.pushNamed(context, '/allquotes');
                          },
                          icon: Icon(Icons.format_quote),
                          label: Text('Random Quotes'),
                        ),
                      ),
                      SizedBox(
                        height: .0,
                      ),
                      Container(
                        child: RaisedButton.icon(
                          color: Colors.black87,
                          textColor: Colors.white70,
                          onPressed: () {
                            quotes();
                          },
                          icon: Icon(Icons.format_quote_outlined),
                          label: Text('Special Quote of the Sceound'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
