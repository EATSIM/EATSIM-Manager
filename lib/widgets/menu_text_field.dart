import 'package:flutter/material.dart';
import '../utils/constants.dart';

class MenuTextField extends StatelessWidget {
  const MenuTextField({
    Key? key,
    required this.width,
    required this.height,
    required this.categoryController,
  }) : super(key: key);

  final double width;
  final double height;
  final TextEditingController categoryController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: categoryController,
        decoration: InputDecoration(
          enabledBorder: _customOutlineInputBorder(),
          focusedBorder: _customOutlineInputBorder(),
        ),
      ),
    );
  }
}

OutlineInputBorder _customOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      color: Constants.menuTextFiledColor,
      width: 1,
    ),
  );
}
