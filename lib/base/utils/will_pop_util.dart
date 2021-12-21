import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


///监听返回键
class WillPopUtils{

  static DateTime lastPopTime;//记录返回键时间

  ///返回键
  static  willPop(context) async{
    // 点击返回键的操作
    if(lastPopTime == null || DateTime.now().difference(lastPopTime) > const Duration(seconds: 2)){
      lastPopTime = DateTime.now();
      Fluttertoast.showToast(msg: '再按一次退出');
    }else{
      lastPopTime = DateTime.now();
      // 退出app
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

}