import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';
import '../widgets/snack_bar.dart';

/* 로그인 서비스 */
class LoginService {
  final storage = const FlutterSecureStorage();

  /* 로그인 정보를 불러오는 함수 */
  Future<String> loadLoginInfo(
    String key,
  ) async {
    final value = await storage.read(key: key) ?? "";
    return value;
  }

  /* 로그인 처리 함수 */
  Future<void> handleLogin(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController idController,
    TextEditingController passwordController,
    bool isChecked,
  ) async {
    if (formKey.currentState!.validate()) {
      if (isChecked) {
        await _saveData("isChecked", "true");
        await _saveData("id", idController.text);
        await _saveData("password", passwordController.text);
      } else {
        await _deleteData("isChecked");
        await _deleteData("id");
        await _deleteData("password");
      }
      // 비동기 작업이 완료된 후에 메인 화면으로 이동
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.pushReplacementNamed(context, Routes.main);
      });
    } else {
      // ID, Password 입력 폼에 값이 없는 경우 에러 메시지 출력
      CustomSnackBar.showSnackBar(context, Constants.loginErrorMessage);
    }
  }

  Future<void> _saveData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> _deleteData(String key) async {
    await storage.delete(key: key);
  }
}
