import 'package:flutter/material.dart';

class FloatingActionBtn extends StatefulWidget {
  const FloatingActionBtn({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  State<FloatingActionBtn> createState() => _FloatingActionBtnState();
}

class _FloatingActionBtnState extends State<FloatingActionBtn> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {
        widget.onPressed();
      },
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
  }
}
