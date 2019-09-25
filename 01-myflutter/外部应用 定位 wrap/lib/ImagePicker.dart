// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:dio/dio.dart';

// class ImagePicker extends StatefulWidget {
//   @override
//   _ImagePickerState createState() => _ImagePickerState();
// }

// class _ImagePickerState extends State<ImagePicker> {
//   File _image;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("ImagePicker"),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: _takePhoto,
//                 child: Text("拍照"),
//               ),
//               RaisedButton(
//                 onPressed: _openGallery,
//                 child: Text("选择图库照片"),
//               ),
//               _buildImage()
//             ],
//           ),
//         ));
//   }

//   // 拍照
//     _takePhoto() async {
    
//      var image = await ImagePicker.pickImage(source: ImageSource.camera,maxWidth:400);

//       setState(() {

//         this._image= image;
//       });

//       this._uploadImage(image);
//   }

  
//   /*相册*/
//   _openGallery() async {
  
//     //  var image = await ImagePicker.pickImage(source: ImageSource.gallery,maxWidth:400);
//     var image= await ImagePicker.pickImage(source:ImageSource.gallery,maxWidth:400);

//       setState(() {

//         this._image= image;
//       });
//   }

//     //定义一个组件显示图片
//   Widget _buildImage(){
//       if(this._image==null){
//         return Text("请选择图片...");
//       }
//       return Image.file(this._image);

//   }

//   //上传图片
//   _uploadImage(_imageDir) async{
//       FormData formData = new FormData.from({
//         "name": "zhangsna 6666666666",
//         "age": 20,
//         "sex":"男",
//         "file":new UploadFileInfo(_imageDir, "xxx.jpg"),
//       });
//       var response = await Dio().post("http://jd.itying.com/imgupload", data: formData);

//       print(response);
//   }

// }

// //pickImage会报错  没有发现原因