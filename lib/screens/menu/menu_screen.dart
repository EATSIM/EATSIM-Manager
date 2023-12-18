import 'package:flutter/material.dart';
import 'menu_category_add_dialog.dart';
import 'menu_edit_dialog.dart';
import '../../data/restaurant_data.dart';
import '../../utils/constants.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> menuCategories = RestaurantData.menuCategories;
  final Map<String, List<Map<String, dynamic>>> foodItems =
      RestaurantData.foodItems;
  int selectedMenuIndex = 0;

  final TextEditingController categoryController = TextEditingController();

  void addMenuCategory(String category) {
    setState(() {
      RestaurantData.addMenuCategory(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /* 좌측 메뉴바 */
          Container(
            width: 200,
            decoration: _border(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 30,
                ),
                /* 메뉴 카테고리 리스트 뷰 */
                Expanded(
                  child: ListView.builder(
                    itemCount: menuCategories.length,
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: () {
                          setState(() {
                            selectedMenuIndex = index;
                          });
                        },
                        child: Container(
                          height: 35,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            menuCategories[index],
                            style: TextStyle(
                              color: selectedMenuIndex == index
                                  ? Colors.white // 선택된 버튼 글자색
                                  : Constants
                                      .unSelectedMenuColor, // 선택되지 않은 버튼 글자색
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                /* 메뉴 카테고리 추가 버튼 */
                Container(
                  color: Colors.black,
                  width: double.infinity,
                  height: 60,
                  child: IconButton(
                    iconSize: 30,
                    splashRadius: 20,
                    onPressed: () {
                      /* 메뉴 카테고리 추가 다이얼로그 */
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return MenuCategoryAddDialog(
                            addMenuCategory: addMenuCategory,
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /* 메인 화면 */
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 50,
                top: 30,
                right: 50,
                bottom: 30,
              ),
              decoration: _border(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 100,
                    child: Text(
                      menuCategories[selectedMenuIndex],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (foodItems[menuCategories[selectedMenuIndex]] == null ||
                      foodItems[menuCategories[selectedMenuIndex]]!.isEmpty)
                    const Expanded(
                      child: Center(
                        child: Text(
                          "메뉴를 추가해 주세요.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 200,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: foodItems[menuCategories[selectedMenuIndex]]!
                            .length,
                        itemBuilder: (context, index) {
                          final item = foodItems[
                              menuCategories[selectedMenuIndex]]![index];
                          return Card(
                            color: Constants.foodCardColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Image.network(
                                    item['사진'],
                                    height: 100,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "${item['음식']}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "${item['가격']}",
                                      style: const TextStyle(
                                        color: Constants.foodPriceColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
      /* 메뉴 추가 버튼 */
      floatingActionButton: Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        child: FloatingActionButton.small(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return MenuEditDialog(
                    categoryController: categoryController,
                    onSavePressed: () {
                      String newCategory = categoryController.text;
                      if (newCategory.isNotEmpty) {
                        setState(() {
                          menuCategories.add(newCategory);
                        });
                        Navigator.of(context).pop();
                      }
                    },
                  );
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

/* 테두리 속성 정의 */
BoxDecoration _border() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 1,
    ),
  );
}
