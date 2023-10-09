import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/main_screen.dart';

// 라우트 정의
class Routes {
  static const login = '/login';
  static const main = '/main';
}

var routes = <String, WidgetBuilder>{
  Routes.login: (context) => const LoginScreen(),
  Routes.main: (context) => const MainScreen(),
};
