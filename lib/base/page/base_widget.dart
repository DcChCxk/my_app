import 'package:flutter/material.dart';
import '../../main.dart';

abstract class BaseWidget extends StatefulWidget {
  @override
  BaseWidgetState createState() {
    return getState();
  }

  BaseWidgetState getState();
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T> with RouteAware {
  String className;
  String tag = "BaseWidgetState_";


  baseBuild(BuildContext context) {
    // if(className == null) { //
    //   className = NavigatorManger().getClassName(context);
    //   tag = tag + className + '_';
    // }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 添加监听订阅
    MyApp.routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    // 移除监听订阅
    MyApp.routeObserver.unsubscribe(this);
    print(tag + "dispose--------\n");
    super.dispose();
  }

  @override
  void didPush() {
    // push进入当前页面时走这里
    super.didPush();
    print(tag + "didPush--------\n");
    onResume();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    // 从其他页面pop回当前页面走这里
    print(tag + "didPopNext--------\n");
    onResume();
  }

  @override
  void didPop() {
    super.didPop();
    print(tag + "didPop--------\n");
    // pop出当前页面时走这里
    onPause();
  }

  @override
  void didPushNext() {
    super.didPushNext();
    // 当前页面push到其他页面走这里
    print(tag + "didPushNext--------\n");
    onPause();
  }

  onResume(){}

  onPause(){}

}
