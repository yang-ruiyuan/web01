import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //为什这里 没调用 什么方法 需要 这个钩子呢
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           RaisedButton(
            child: Text("跳到新闻页面"),
            onPressed: (){
              Navigator.pushNamed(context, "/news");
            },
          ),
          RaisedButton(
            child: Text("跳到电影页面"),
            onPressed: (){
              Navigator.pushNamed(context, "/movie");
            },
          ),
        ],
      ),
    );
  }
}
