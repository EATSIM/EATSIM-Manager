import 'package:eatsim/widgets/hide_keyboard.dart';
import 'package:flutter/material.dart';
import 'utils/routes.dart';
import 'utils/themes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.themeData,
      builder: (context, child) {
        return HideKeyboard(child: child!);
      },
      initialRoute: Routes.login,
      routes: routes,
    );
  }
}
