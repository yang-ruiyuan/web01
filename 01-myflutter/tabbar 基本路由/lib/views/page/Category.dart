import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分类页面"),
      ),
      body: Container(
        child: Text(
          "分类页面",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
