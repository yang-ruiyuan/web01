import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  // 这行如果  看着不舒服 可以不用写 哈哈
  // const SearchPage({Key key}) : super(key: key);
  final arguments;
  SearchPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("搜索页面"),
      ) ,
      // body: Text("搜索页面内容区域"),
      // 显示home里面传过来 的参数
      body: Text("${arguments['id']}"),
    );
  }
}
