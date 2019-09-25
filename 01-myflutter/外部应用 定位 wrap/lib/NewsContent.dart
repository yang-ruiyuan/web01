import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:dio/dio.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class NewsContent extends StatefulWidget {
  // 这里接受参数 是 可能要 必须 使用Key 否则 Routes路由中的参数 会报错
  Map arguments;
  NewsContent({Key key, this.arguments}) : super(key: key);

  @override
  _NewsContentState createState() => _NewsContentState(this.arguments);
}

class _NewsContentState extends State<NewsContent> {
  // 路由的而接收参数
  Map arguments;
  _NewsContentState(this.arguments);
  List _list = [];
  bool _flag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // this._getData();
  }

  // void _getData() async {
  //   var apiUrl =
  //       "http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${this.arguments['aid']}";
  //   var response = await Dio().get(apiUrl);
  //   // print(response.data);
  //   setState(() {
  //     this._list = json.decode(response.data)["result"];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新闻详情"),
        ),
        // body: ListView(
        //   children: <Widget>[
        //     Html(
        //       data: """
        //         ${this._list.length > 0 ? this._list[0]['content'] : ''}
        //       """,
        //       //Optional parameters:
        //       padding: EdgeInsets.all(8.0),
        //       backgroundColor: Colors.white70,
        //       defaultTextStyle: TextStyle(fontFamily: 'serif'),
        //       linkStyle: const TextStyle(
        //         color: Colors.redAccent,
        //       ),
        //       onLinkTap: (url) {
        //         // open url in a webview
        //       },
        //     )
        //   ],
        // ),
        body: Column(
          children: <Widget>[
            this._flag ? _getMoreWidget() : Text(""),
            Expanded(
              child: InAppWebView(
                initialUrl:
                    "http://www.phonegap100.com/newscontent.php?aid=${this.arguments["aid"]}",
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  // print("......");
                  // print(progress/100);
                  // print("......");
                  if ((progress / 100).toInt() == 1.0) {
                    setState(() {
                      this._flag = false;
                    });
                  }
                },
              ),
            ),
          ],
        ));
  }

  // 这是一个小圈圈的组件
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "加载中....",
              style: TextStyle(fontSize: 16),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
