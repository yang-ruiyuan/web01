import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _news = "";
  @override
  void initState() {
    //为什这里 没调用 什么方法 需要 这个钩子呢
    // TODO: implement initState
    super.initState();
  }

  void _getData() async {
    print("...........");
    // Map userInfo = {"username": "wangcai", "age": 100};
    // //把对象转换字符串  什么意思
    // print(json.encode(userInfo));  // {"username":"wangcai","age":100}
    // print(json.encode(userInfo) is String);  // true
    // print(json.encode(userInfo) is Map);  // false

    //把字符串转换成对象
    // String userInfo = '{"username": "wangcai", "age": 100}';
    // print(json.decode(userInfo)); // {username: wangcai, age: 100}
    // print(json.decode(userInfo) is String); // false
    // print(json.decode(userInfo) is Map); //  true

    var apiUrl = "http://192.168.1.102:3000/api/users/news";
    var result = await http.get(apiUrl);
    // print(result.statusCode);
    if (result.statusCode == 200) {
      // print(result.body);  // {"msg":"新闻数据"}   字符串
      setState(() {
        //选哟把字符串 转成对象
        this._news = json.decode(result.body)["msg"]; //字符串 要转成 对象 给_news.
      });
    }
  }

  void _postData() async {
    var apiUrl = "http://192.168.1.102:3000/api/users/login";

    var result =
        await http.post(apiUrl, body: {"username": "wangcai", "age": "10"});

    if (result.statusCode == 200) {
      print(json.decode(result.body)); //并返回了{msg: login success}
    } else {
      print(result.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(this._news),
          RaisedButton(
            child: Text("Get请求数据"),
            onPressed: _getData,
          ),
          RaisedButton(
            child: Text("post请求数据"),
            onPressed: _postData,
          ),
          RaisedButton(
            child: Text("请求数据并渲染数据"),
            onPressed: (){
              Navigator.pushNamed(context, "/http");
            },
          ),
        ],
      ),
    );
  }
}
