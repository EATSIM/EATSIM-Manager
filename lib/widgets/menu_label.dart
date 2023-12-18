import 'package:flutter/material.dart';
import '../utils/constants.dart';

class MenuLabel extends StatelessWidget {
  const MenuLabel({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Constants.menuTextColor,
      ),
    );
  }
}
