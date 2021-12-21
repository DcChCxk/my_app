
import 'package:flutter/material.dart';
import 'package:my_app/base/res/constant.dart';
import 'package:sp_util/sp_util.dart';

/*1.创建theme数据Model
    这里的 Model 实际上就是我们的状态，它不仅储存了我们的数据模型，而且还包含了更改数据的方法，并暴露出它想要暴露出的数据
*/
class ThemeModel with ChangeNotifier {

  String _theme = SpUtil.getString(Constant.theme)==""?'blue': SpUtil.getString(Constant.theme);
  String get value => _theme;


  void setTheme(color) async {
    _theme = color;
    await SpUtil.putString(Constant.theme, _theme);
    notifyListeners(); //通知依赖的Widget更新
  }
}