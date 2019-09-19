import 'package:flutter/material.dart';

import './page/Category.dart';
import './page/Home.dart';
import './page/Search.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
//初始化_currentIndex为0
  int _currentIndex = 0;
//使用三个分类组件
  List _pageList = <Widget>[
    Home(),
    Category(),
    Search(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: this._pageList[_currentIndex],
      //主要组件实现TabBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index) {
          // print(index);
          setState(() {
            this._currentIndex = index;
          });
        },
        
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("分类")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("搜索")),
        ],
      ),
    );
  }
}
