// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `hello`
  String get App_Title {
    return Intl.message(
      'hello',
      name: 'App_Title',
      desc: '',
      args: [],
    );
  }

  /// `Have Fun`
  String get have_fun {
    return Intl.message(
      'Have Fun',
      name: 'have_fun',
      desc: '',
      args: [],
    );
  }

  /// `Daily News`
  String get daily_news {
    return Intl.message(
      'Daily News',
      name: 'daily_news',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history_today {
    return Intl.message(
      'History',
      name: 'history_today',
      desc: '',
      args: [],
    );
  }

  /// `Weather`
  String get weather_query {
    return Intl.message(
      'Weather',
      name: 'weather_query',
      desc: '',
      args: [],
    );
  }

  /// `Rubbish`
  String get rubbish_classify {
    return Intl.message(
      'Rubbish',
      name: 'rubbish_classify',
      desc: '',
      args: [],
    );
  }

  /// `Phone Local`
  String get phone_local {
    return Intl.message(
      'Phone Local',
      name: 'phone_local',
      desc: '',
      args: [],
    );
  }

  /// `Dictionary`
  String get dictionary {
    return Intl.message(
      'Dictionary',
      name: 'dictionary',
      desc: '',
      args: [],
    );
  }

  /// `IP`
  String get ip {
    return Intl.message(
      'IP',
      name: 'ip',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message(
      'Detail',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Me`
  String get me {
    return Intl.message(
      'Me',
      name: 'me',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to Logout ?`
  String get whether_logout {
    return Intl.message(
      'Do you want to Logout ?',
      name: 'whether_logout',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Query`
  String get query {
    return Intl.message(
      'Query',
      name: 'query',
      desc: '',
      args: [],
    );
  }

  /// `Which Chinese character do you want to query`
  String get dictionary_query {
    return Intl.message(
      'Which Chinese character do you want to query',
      name: 'dictionary_query',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct mobile phone number ！`
  String get right_phone {
    return Intl.message(
      'Please enter the correct mobile phone number ！',
      name: 'right_phone',
      desc: '',
      args: [],
    );
  }

  /// `The mobile phone number is belong ：`
  String get phone_belong {
    return Intl.message(
      'The mobile phone number is belong ：',
      name: 'phone_belong',
      desc: '',
      args: [],
    );
  }

  /// `Related search :`
  String get related_search {
    return Intl.message(
      'Related search :',
      name: 'related_search',
      desc: '',
      args: [],
    );
  }

  /// `is`
  String get is_this {
    return Intl.message(
      'is',
      name: 'is_this',
      desc: '',
      args: [],
    );
  }

  /// `City name`
  String get city_name {
    return Intl.message(
      'City name',
      name: 'city_name',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Chinese`
  String get chinese {
    return Intl.message(
      'Chinese',
      name: 'chinese',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get choose_language {
    return Intl.message(
      'Choose Language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Rubbish Classify :`
  String get rubbish_query {
    return Intl.message(
      'Rubbish Classify :',
      name: 'rubbish_query',
      desc: '',
      args: [],
    );
  }

  /// `The function has not been realized yet !`
  String get no_finish {
    return Intl.message(
      'The function has not been realized yet !',
      name: 'no_finish',
      desc: '',
      args: [],
    );
  }

  /// `Choose Theme`
  String get change_theme {
    return Intl.message(
      'Choose Theme',
      name: 'change_theme',
      desc: '',
      args: [],
    );
  }

  /// `blue`
  String get blue {
    return Intl.message(
      'blue',
      name: 'blue',
      desc: '',
      args: [],
    );
  }

  /// `purple`
  String get purple {
    return Intl.message(
      'purple',
      name: 'purple',
      desc: '',
      args: [],
    );
  }

  /// `pink`
  String get pink {
    return Intl.message(
      'pink',
      name: 'pink',
      desc: '',
      args: [],
    );
  }

  /// `yellow`
  String get yellow {
    return Intl.message(
      'yellow',
      name: 'yellow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}