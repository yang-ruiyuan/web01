import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  // 年月日
  DateTime _nowDate = DateTime.now();
  _showDataPicker() async {
    // // showDatePicker 调用flutter内置的datepicker
    // showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(1980),
    //   lastDate: DateTime(2100)
    // ).then((result){
    //   print(result);  //  2019-09-30 00:00:00.000
    // });
    var result = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2100));
    setState(() {
      this._nowDate = result;
    });
  }

  // 时分秒
  var _nowTime = TimeOfDay(hour: 12, minute: 10);
  _showTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: _nowTime);
    print(result); // TimeOfDay(03:10)
    setState(() {
      this._nowTime = result;
    });
  }

  @override
  void initState() {
    // 1970年01月19   从服务器得到的一般都是一个时间戳
    print(formatDate(DateTime.fromMicrosecondsSinceEpoch(1569034049327),
        [yyyy, "年", mm, "月", dd]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期处理"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 格式化时间  内置额 
                Text(
                  "${formatDate(_nowDate, [yyyy, '年', mm, '月', dd])}",
                  style: TextStyle(fontSize: 38),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            onTap: _showDataPicker,
          ),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // 格式化时间  内置的 
                Text(
                  "${_nowTime.format(context)}",
                  style: TextStyle(fontSize: 38),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            ),
            onTap: _showTimePicker,
          )
        ],
      ),
    );
  }
}
