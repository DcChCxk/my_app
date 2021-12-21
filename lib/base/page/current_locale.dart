import 'package:flutter/material.dart';
import 'package:my_app/base/res/constant.dart';
import 'package:sp_util/sp_util.dart';

class CurrentLocale with ChangeNotifier {
  Locale _locale = SpUtil.getString(Constant.locale) == ""
      ? const Locale('zh', "CH")
      : getLocale(SpUtil.getString(Constant.locale));

  Locale get value => _locale;
  Future<void> setLocale(locale) async {
    if (locale == "zh") {
      _locale = const Locale('zh', "CH");
    } else if (locale == "en") {
      _locale = const Locale('en', "US");
    }
    await SpUtil.putString(Constant.locale, locale);
    notifyListeners();
  }

  static Locale getLocale(locale) {
    if (locale == "zh") {
      return const Locale('zh', "CH");
    } else if (locale == "en") {
      return const Locale('en', "US");
    }
  }
}
