import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 230,
              child: Image.asset("assets/images/logo.png"),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 400,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: _idController,
                decoration: const InputDecoration(
                  focusColor: Colors.white,
                  filled: true,
                  fillColor: Color(0xff464A50),
                  hintText: 'ID',
                  hintStyle: TextStyle(color: Color(0xff898989)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1)),
                      borderSide: BorderSide(color: Color(0xff464A50))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1)),
                      borderSide: BorderSide(color: Color(0xff464A50))),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 400,
              child: TextField(
                obscureText: true,
                controller: _pwController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xff464A50),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Color(0xff898989)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1)),
                      borderSide: BorderSide(color: Color(0xff464A50))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1)),
                      borderSide: BorderSide(color: Color(0xff464A50))),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      activeColor: const Color(0xffF8C044),
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        if (!states.contains(MaterialState.selected)) {
                          return Colors.white;
                        }
                        return null;
                      }),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                            const BorderSide(width: 1.0, color: Colors.white),
                      ),
                      value: _isChecked,
                      onChanged: ((value) {
                        setState(() => _isChecked = value!);
                      })),
                  const SizedBox(width: 5),
                  const Text(
                    "Remember me",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 400,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  print("ID: ${_idController.text}, PW: ${_pwController.text}");
                  _idController.clear();
                  _pwController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF8C044),
                ),
                child: const Text(
                  "Login",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
