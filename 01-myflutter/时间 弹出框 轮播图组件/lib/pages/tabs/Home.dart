import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("dialog"),
              onPressed: () {
                //命名式路由
                // Navigator.pushNamed(context, "/dataPicker");
                // Navigator.pushNamed(context, "/dataPickerPub");
                // Navigator.pushNamed(context, "/swiper");
                Navigator.pushNamed(context, "/dialog");

              },
              // 配置颜色主题
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
