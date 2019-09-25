// import 'package:flutter/material.dart';

// import 'package:amap_location/amap_location.dart';

// class LocationPage extends StatefulWidget {
//   LocationPage({Key key}) : super(key: key);

//   _LocationPageState createState() => _LocationPageState();
// }

// class _LocationPageState extends State<LocationPage> {

//   double _longitude=0;
//   double _latitude=0;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     this._getLocation();
//   }


//   _getLocation() async{
//     //启动一下
//     await AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters  ));  
//     //获取地理位置
//     var result = await AMapLocationClient.getLocation(true);

//     print("经度:${result.longitude}");

//     print("纬度:${result.latitude}");

//     setState(() {
//        this._longitude=result.longitude;
//        this._latitude=result.latitude;
//     });

//   } 


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("地理定位演示"),
//       ),
//       body:Column(
//         children: <Widget>[
//           Text("经度:${this._longitude}"),
//           Text("纬度:${this._latitude}"),
//         ],
//       ),
//     );
//   }
// }