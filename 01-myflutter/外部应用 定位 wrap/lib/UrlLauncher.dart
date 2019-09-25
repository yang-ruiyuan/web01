import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatefulWidget {
  @override
  _UrlLauncherState createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("外部应用"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("打开浏览器"),
              onPressed: () async {
                const url = "http://www.baidu.com";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Conld not launch $url";
                }
              },
            ),
            RaisedButton(
              child: Text("拨打电话"),
              onPressed: () async {
                const tel = "tel:10086";
                if (await canLaunch(tel)) {
                  await launch(tel);
                } else {
                  throw "Conld not launch $tel";
                }
              },
            ),
            RaisedButton(
              child: Text("发送短信"),
              onPressed: () async {
                const tel = "sms:10086";
                if (await canLaunch(tel)) {
                  await launch(tel);
                } else {
                  throw "Conld not launch $tel";
                }
              },
            ),
            RaisedButton(
              child: Text("打开微信"),
              onPressed: () async {
                const url = "weixin://";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Conld not launch $url";
                }
              },
            ),
            RaisedButton(
              child: Text("打开支付宝"),
              onPressed: () async {
                const url = "alipays://";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw "Conld not launch $url";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
