import 'package:flutter/material.dart';

import '../pages/Tabs.dart';
import '../pages/Form.dart';
import '../pages/Search.dart';

// 配置路由规则 
final routes = {
  "/":(context)=>Tabs(),
  "/form":(context)=>FormPage(),
  "/search":(context,{arguments})=>SearchPage(arguments: arguments),
};

// 如果你要把路由抽离出去，需要写下面这一堆的代码
var onGenerateRoute=(RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};