import 'package:flutter/material.dart';

class MenuEditButton extends StatefulWidget {
  const MenuEditButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MenuEditButton> createState() => _MenuEditButtonState();
}

class _MenuEditButtonState extends State<MenuEditButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 30,
      margin: const EdgeInsets.only(right: 5),
      color: Colors.black,
      child: TextButton(
        onPressed: () {
          widget.title == "메뉴 추가하기"
              ? print("Clicked on 메뉴 추가하기")
              : print("Clicked on 메뉴 삭제하기");
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
