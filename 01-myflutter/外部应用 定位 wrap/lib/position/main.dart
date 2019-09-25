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
            Positioned(top: 20, left: 20, child: Icon(Icons.home)),
            Positioned(bottom: 30, left: 30, child: Icon(Icons.search)),
            Positioned(bottom: 0, left: 0, child: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
