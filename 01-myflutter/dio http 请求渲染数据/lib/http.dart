import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';  //第三方插件 请求数据 和 http功能是一样的


class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  List _list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();

  }
  _getData() async{
    var apiUrl = "https://movie.douban.com/j/search_subjects?type=movie&tag=热门&page_limit=50&page_start=0";
    
    // Http请求数据
    // var result = await http.get(apiUrl);
    
    // if(result.statusCode == 200){
    //   // print(result.body);
    //   setState(() {
    //    this._list = json.decode(result.body)["subjects"];
    //   });
    // }else{
    //   print("失败了...${result.statusCode}");
    // }
    /*--------------------------------------*/
    // Dio求情数据
    var result = await Dio().get(apiUrl);
    setState(() {
     this._list = result.data["subjects"]; 
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("请求数据，渲染数据"),
      ),
      body: this._list.length>0 ? ListView.builder(
        itemCount: this._list.length,
        itemBuilder: (context,index){
          return ListTile(
            leading: Image.network("${this._list[index]['cover']}"),
            title: Text("${this._list[index]['title']}"),
          );
        },
      ):Text("加载中...")
    );
  }
}
