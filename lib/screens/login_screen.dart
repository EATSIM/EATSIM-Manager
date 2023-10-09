import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../servies/login_service.dart';
import '../widgets/input_form.dart';

/* 로그인 화면 */
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginService = LoginService(); // 로그인 로직 인스턴스
  final formKey = GlobalKey<FormState>(); // ID, Password 입력 폼의 키
  final idController = TextEditingController(); // ID 입력 폼의 컨트롤러
  final passwordController = TextEditingController(); // Password 입력 폼의 컨트롤러
  bool isChecked = false; // ID, Password 저장 체크박스의 상태

  @override
  void initState() {
    super.initState();
    _load(); // 로그인 정보 저장되어 있다면 ID, Password 불러오기
  }

  /* ID, Password를 불러오는 함수 */
  void _load() async {
    isChecked = await loginService.loadLoginInfo("isChecked") == "true";
    if (isChecked) {
      idController.text = await loginService.loadLoginInfo("id");
      passwordController.text = await loginService.loadLoginInfo("password");
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* 로고 이미지 */
              SizedBox(
                width: 200,
                child: Image.asset(Constants.logoImage),
              ),
              const SizedBox(
                height: 50,
              ),
              /* 로그인 폼 */
              SizedBox(
                width: 400,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      /* ID 입력 폼 */
                      InputForm(
                        controller: idController,
                        hintText: "ID",
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return Constants.idErrorMessage;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      /* Password 입력 폼 */
                      InputForm(
                        controller: passwordController,
                        hintText: "Password",
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return Constants.passwordErrorMessage;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /* ID, Password 저장 체크박스 */
                          Checkbox(
                            activeColor: Constants.primaryColor,
                            fillColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (!states.contains(MaterialState.selected)) {
                                return Colors.white;
                              }
                              return null;
                            }),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => const BorderSide(
                                  width: 1.0, color: Colors.white),
                            ),
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      /* 로그인 버튼 */
                      SizedBox(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            loginService.handleLogin(context, formKey,
                                idController, passwordController, isChecked);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
