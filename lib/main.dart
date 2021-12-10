import 'package:flutter/material.dart';
import 'package:my_app/ui/splash_page.dart';

import 'base/res/Constant.dart';
import 'base/utils/app_theme.dart';
import 'ui/home_page.dart';
import 'ui/login/login_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // 用于路由返回监听
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final easyLoad = EasyLoading.init();
    return MaterialApp(
      title: 'My APP',
      routes: {
        Constant.routeMain: (ctx) => HomePage(0),
        Constant.routeLogin: (ctx) => LoginPage()
      },
      debugShowCheckedModeBanner: false, // 隐藏DEBUG
      theme: AppTheme().lightTheme,
      home: SplashPage(),//引导页,
        builder: (context, child) {
          child = easyLoad(context, child);
          return child;
        }
    );
  }

}
