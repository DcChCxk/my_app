import 'package:flutter/material.dart';

class AppTheme {
  AppTheme({ColoraccentColor}) {
    _accentColor = _accentColor ?? Color(0xFF3366FF);
  }

  Color _accentColor;

  // Light theme
  ThemeData get lightTheme => ThemeData(
      primaryColor: Color(0xFFF7F8FA),
      primaryColorLight: Colors.white,
      primaryColorDark: Color(0xFF171E29),
      dialogBackgroundColor: Colors.white,
      backgroundColor: Colors.grey[100],
      scaffoldBackgroundColor: Color(0xFFF7F8FA),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: Color(0xFFF7F8FA),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF171E29),
        ),
        elevation: 0,
      ),
      textTheme: TextTheme(
        button: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline3: TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline4: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        subtitle1: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: Color(0xff7f7f7f),
        ),
        subtitle2: TextStyle(
          fontSize: 14.0,
          color: Color(0xFF3366FF),
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: Color(0xff171e29),
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: Color(0xFF7F7F7F),
        ),
        caption: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey[400],
      ),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: _accentColor,
          selectionHandleColor: _accentColor,
          selectionColor: _accentColor.withOpacity(0.6)),
      buttonTheme: ButtonThemeData(
        height: 32,
        hoverColor: Colors.grey[100].withAlpha(70),
        splashColor: Colors.grey[100].withAlpha(70),
      ),
      dividerTheme: DividerThemeData(color: Color(0xFFDADADA)),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
      )),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: _accentColor));

  // Dark theme
  ThemeData get darkTheme => ThemeData.dark().copyWith();
}
