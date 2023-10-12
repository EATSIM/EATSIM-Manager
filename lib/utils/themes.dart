import 'package:flutter/material.dart';
import 'color_formatter.dart';
import 'constants.dart';

class Themes {
  static ThemeData themeData = ThemeData(
    // 강조 색상
    primarySwatch: ColorFormatter.createMaterialColor(
      Constants.primaryColor,
    ),
    // 배경 색상
    scaffoldBackgroundColor: Constants.backgroundColor,
    // 앱바 테마
    appBarTheme: const AppBarTheme(
      backgroundColor: Constants.primaryColor,
    ),
    // 탭바 테마
    tabBarTheme: TabBarTheme(
      indicator: const BoxDecoration(),
      labelColor: Colors.white,
      labelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
    ),
  );
}
