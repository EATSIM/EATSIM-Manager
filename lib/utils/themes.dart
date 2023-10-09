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
    // 앱 바 테마
    appBarTheme: const AppBarTheme(
      backgroundColor: Constants.primaryColor,
    ),
  );
}
