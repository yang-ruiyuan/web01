import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  void _alertDialog() async {
    var result = await showDialog(
        barrierDismissible: false, // 当点击遮罩层时，是否把弹出框消化掉
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("你确定要删除吗？"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  print("取消");
                  Navigator.pop(context, "cancel");
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  print("确定");
                  Navigator.pop(context, "ok");
                },
              )
            ],
          );
        });
    // print(result);
  }

  void _simpleDialog() async {
    var result = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("选择内容"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("选择A"),
                onPressed: () {
                  Navigator.pop(context, "A");
                },
              ),
              Divider(),
              SimpleDialogOption(
                child: Text("选择B"),
                onPressed: () {
                  Navigator.pop(context, "B");
                },
              )
            ],
          );
        });
    // print(result);
  }

  void _modelBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 180,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("分享到朋友圈1"),
                  onTap: () {
                    Navigator.pop(context, "分享到朋友圈1");
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("分享到朋友圈2"),
                  onTap: () {
                    Navigator.pop(context, "分享到朋友圈2");
                  },
                ),
              ],
            ),
          );
        });
    print(result);
  }

  void _toast() async {
    print("toast...");
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dialog"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("AlertDialog"),
              onPressed: _alertDialog,
            ),
            RaisedButton(
              child: Text("SimpleDialog"),
              onPressed: _simpleDialog,
            ),
            RaisedButton(
              child: Text("showModalBottomSheet"),
              onPressed: _modelBottomSheet,
            ),
            RaisedButton(
              child: Text("toast第三方"),
              onPressed: _toast,
            ),
          ],
        ),
      ),
    );
  }
}
