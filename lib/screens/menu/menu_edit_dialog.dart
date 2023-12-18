import 'package:eatsim/widgets/menu_text_field.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/button.dart';
import '../../widgets/menu_label.dart';

class MenuEditDialog extends StatefulWidget {
  const MenuEditDialog({
    Key? key,
    required this.categoryController,
    required this.onSavePressed,
  }) : super(key: key);

  final TextEditingController categoryController;
  final VoidCallback onSavePressed;

  @override
  State<MenuEditDialog> createState() => _MenuEditDialogState();
}

class _MenuEditDialogState extends State<MenuEditDialog> {
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        width: 700,
        height: 600,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Constants.menuTextColor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MenuLabel(
                          title: "메뉴 카테고리",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MenuTextField(
                          width: 250,
                          height: 35,
                          categoryController: categoryController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const MenuLabel(
                          title: "이름",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MenuTextField(
                          width: 250,
                          height: 35,
                          categoryController: categoryController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const MenuLabel(
                          title: "가격",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MenuTextField(
                          width: 250,
                          height: 35,
                          categoryController: categoryController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const MenuLabel(
                          title: "상세정보",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MenuTextField(
                          width: 250,
                          height: 35,
                          categoryController: categoryController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const MenuLabel(
                          title: "이미지 첨부",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        MenuTextField(
                          width: 250,
                          height: 35,
                          categoryController: categoryController,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MenuLabel(
                          title: "재료 및 원산지",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            MenuTextField(
                              width: 80,
                              height: 35,
                              categoryController: categoryController,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            MenuTextField(
                              width: 160,
                              height: 35,
                              categoryController: categoryController,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    title: "메뉴 삭제",
                    textColor: Colors.white,
                    onSavePressed: widget.onSavePressed,
                  ),
                  Button(
                    title: "메뉴 저장",
                    textColor: Colors.white,
                    onSavePressed: widget.onSavePressed,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
