import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/Tabs.dart';
import 'pages/Form.dart';
import 'pages/Search.dart';

import 'routes/Routes.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('zh','CH'), // 中文
          const Locale('en', 'US'), // English
          const Locale('he', 'IL'), // Hebrew
        ],
      // home:Tabs(),
      // routes: {
      //   "/form":(context)=>FormPage(),
      //   "/search":(context)=>SearchPage(),
      // },
      initialRoute: "/", // 默认访问路径
      onGenerateRoute: onGenerateRoute
    );
  }
}

