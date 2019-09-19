import 'package:flutter/material.dart';

import './Category.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("跳转分类"),
            onPressed: (){
              //实现路由的跳转
              Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=>Category()
              )
              );
            },
          )
        ],
      ),
    );
  }
}
