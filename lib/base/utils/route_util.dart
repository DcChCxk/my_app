
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/base/res/constant.dart';
import 'package:my_app/ui/home_page.dart';

class RouteUtil {

  ///跳转到首页
  static void goMain(BuildContext context, {int index: 0}){
    pushReplacement(context, HomePage(index));
  }

  static void goLogin(BuildContext context){
    pushReplacement(context, Constant.routeLogin);
  }

  ///通过路由名称跳转
  static void pushNamed(BuildContext context, String pageName, {Function callback}) {
    Navigator.of(context).pushNamed(pageName).then((value) {
      if(ObjectUtil.isNotEmpty(callback)) {
        callback(value);
      }
    });
  }

  /// 通过路由名称跳转，并且清除栈路由
  static void pushReplacementNamed(BuildContext context, String pageName,{Function callback}) {
    Navigator.of(context).pushReplacementNamed(pageName).then((value) => callback);
  }

  /// 跳转路由，并且清除栈路由
  static void pushReplacement(BuildContext context, page){
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) {
      return page;
    }));
  }



  /// 从屏幕右边进入一个新的页面
  static void startActivity(BuildContext context, page, {Function callback}) {
    Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
      return page;
    })).then((value) {
      if(ObjectUtil.isNotEmpty(callback)) {
        callback(value);
      }
    });
  }

}