import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class SelfHttpRequest extends StatefulWidget {
  @override
  _SelfHttpRequestState createState() => _SelfHttpRequestState();
}

class _SelfHttpRequestState extends State<SelfHttpRequest> {
  List _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("helo http"),
      ),

      //定义底角按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // print("123");
          http1();
        },
      ),
      //body主体内容
      body: Container(
        child: Text("data"),
      ),
    );
  }

  http1() async {
    String url =
        "https://www.easy-mock.com/mock/5d3edd4f3c8cb83f47c8a4a1/maozuo/maizuo";
    http.Response response = await http.get(url);
    // print(response);  //Instance of 'Response'
    // print(response.body); // 得到原始直接数据
    Map<String, dynamic> responseData = json.decode(response.body); // 转成json对象
    // print(responseData);
    setState(() {
     this._list =  responseData["movieList"];
    });
  }
}
