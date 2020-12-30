import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quote_app/services/quotes.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void quotes() async {
    Quotes instance = Quotes(url: 'today');
    await instance.getQuote();
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {'quote': instance.quote, 'author': instance.author});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      quotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
