import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import './Http/SelfHttpRequest.dart';

import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SelfHttpRequest(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("定位"),
        ),
        body: PosionDemo(),
      ),
    );
  }
}

class PosionDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.home),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.search),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
