

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:my_app/base/res/dimens.dart';

class MyAppBar extends AppBar {

  MyAppBar({String title, BuildContext context, bool isReturn: true}): super (
    backgroundColor: Colors.white,
    brightness:  Brightness.light,
//    iconTheme: IconThemeData(color: Colors.black, ),
    leading: isReturn?new IconButton(
      icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
    ): null,
    title: MyAppTitle.appTitle(title: title),
    centerTitle: true,
    elevation: 0.2,
  );
}


class MyAppTitle {
  static Text appTitle({@required String title, Color color, double fontSize:17}) {
    if (ObjectUtil.isEmpty(color)) {
      color = Colors.black;
    }
    return Text(title, style: TextStyle(color: color, fontSize: MyDimens.getSp(fontSize), fontWeight: FontWeight.bold),);
  }
}