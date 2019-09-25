import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import './Http/SelfHttpRequest.dart';


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
    return Stack(
      // alignment: Alignment.center,
      alignment:AlignmentDirectional.center,
      textDirection: TextDirection.ltr,
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        
        Container(
          width: 100,
          height: 100,
          color: Colors.white,
        ),
        Text("hello stack"),
        Text("data")
        
        
      ],
    );
  }
}
