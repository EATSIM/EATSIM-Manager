import 'package:flutter/material.dart';
import '../utils/constants.dart';

class InputForm extends StatefulWidget {
  const InputForm({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.hintText.contains("Password"),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Constants.hintTextColor,
        ),
        filled: true,
        fillColor: Constants.textFieldColor,
        enabledBorder: _customOutlinedBorder(),
        focusedBorder: _customOutlinedBorder(),
        errorBorder: _customOutlinedBorder(),
        focusedErrorBorder: _customOutlinedBorder(),
      ),
    );
  }
}

OutlineInputBorder _customOutlinedBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(0)),
    borderSide: BorderSide(
      color: Constants.textFieldColor,
    ),
  );
}
