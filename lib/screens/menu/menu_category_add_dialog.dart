import 'package:eatsim/widgets/menu_text_field.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/button.dart';
import '../../widgets/menu_label.dart';

class MenuCategoryAddDialog extends StatefulWidget {
  const MenuCategoryAddDialog({
    Key? key,
    required this.addMenuCategory,
  }) : super(key: key);

  final Function(String) addMenuCategory;

  @override
  State<MenuCategoryAddDialog> createState() => _MenuCategoryAddDialogState();
}

class _MenuCategoryAddDialogState extends State<MenuCategoryAddDialog> {
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        height: 275,
        width: 340,
        child: Center(
          child: Column(
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
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment(-0.6, 0),
                child: MenuLabel(
                  title: "메뉴 카테고리",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MenuTextField(
                width: 250,
                height: 35,
                categoryController: categoryController,
              ),
              const SizedBox(
                height: 60,
              ),
              Button(
                title: "저장",
                textColor: Colors.white,
                onSavePressed: () {
                  String newCategory = categoryController.text;
                  if (newCategory.isNotEmpty) {
                    widget.addMenuCategory(newCategory);
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
