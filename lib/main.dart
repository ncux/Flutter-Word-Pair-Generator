import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'WordPair Generator',
            style: TextStyle(
                fontFamily: 'SigmarOne',   //  as in the pubspec.yaml
                fontSize: 20,
                fontWeight: FontWeight.normal,
                letterSpacing: 4,
                color: Colors.white
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text('CumLover!!!'),
        ),
      ),
    );
  }
}