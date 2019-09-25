import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:dio/dio.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List _list = [];
  int _page = 1;
  bool hasMore = true; //判断有没有数据
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();

    //监听滚动条事件
    _scrollController.addListener(() {
      print(_scrollController.position.pixels.toInt()); //获取滚动条下拉的距离

      print(_scrollController.position.maxScrollExtent.toInt()); //获取整个页面的高度

      if (_scrollController.position.pixels.toInt() ==
          _scrollController.position.maxScrollExtent.toInt()) {
        this._getData();
      }
    });
  }

  void _getData() async {
    if (this.hasMore) {
      var apiUrl =
          "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}";

      var response = await Dio().get(apiUrl);
      var res = json.decode(response.data)["result"];
      setState(() {
        this._list.addAll(res); //拼接
        this._page++;
      });

//判断是否是最后一页
      if (res.length < 20) {
        setState(() {
          this.hasMore = false;
        });
      }
    }
  }

  //下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      print('请求数据完成');
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻列表"),
      ),
      body: this._list.length > 0
          ? RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: this._list.length, //20
                itemBuilder: (context, index) {
                  //19
                  if (index == this._list.length - 1) {
                    //列表渲染到最后一条的时候加一个圈圈
                    //拉到底
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("${this._list[index]["title"]}",
                              maxLines: 1),
                          onTap: () {
                            Navigator.pushNamed(context, "/newsContent",
                                arguments: {"aid": this._list[index]["aid"]});
                          },
                        ),
                        Divider(),
                        _getMoreWidget()
                      ],
                    );
                  } else {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("${this._list[index]["title"]}",
                              maxLines: 1),
                          onTap: () {
                            Navigator.pushNamed(context, "/newsContent",
                                arguments: {"aid": this._list[index]["aid"]});
                          },
                        ),
                        Divider()
                      ],
                    );
                  }
                },
              ),
            )
          : _getMoreWidget(),
    );
  }

  //加载中的等待条
  Widget _getMoreWidget() {
    if (hasMore) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
              CircularProgressIndicator(
                strokeWidth: 1.0,
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text("--我是有底线的--"),
      );
    }
  }
}
