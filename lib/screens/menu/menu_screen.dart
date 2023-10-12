import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> menuCategories = ["한식", "중식", "일식"];
  final Map<String, List<Map<String, dynamic>>> foodItems = {
    "한식": [
      {
        "음식": "김치찌개",
        "가격": "7,000",
        "사진":
            "https://1801889e95b1f9bf.kinxzone.com/webfile/product/7/7273/kl69nl3lk448.jpg",
      },
      {
        "음식": "된장찌개",
        "가격": "8,000",
        "사진":
            "https://1801889e95b1f9bf.kinxzone.com/webfile/product/7/7273/kl69nl3lk448.jpg",
      },
      {
        "음식": "순두부찌개",
        "가격": "8,000",
        "사진":
            "https://1801889e95b1f9bf.kinxzone.com/webfile/product/7/7273/kl69nl3lk448.jpg",
      },
      {
        "음식": "제육볶음",
        "가격": "8,000",
        "사진":
            "https://1801889e95b1f9bf.kinxzone.com/webfile/product/7/7273/kl69nl3lk448.jpg",
      },
      {
        "음식": "불고기",
        "가격": "8,000",
        "사진":
            "https://1801889e95b1f9bf.kinxzone.com/webfile/product/7/7273/kl69nl3lk448.jpg",
      },
    ],
    "중식": [
      {
        "음식": "짜장면",
        "가격": "6,500",
        "사진":
            "https://1801889e95b1f9bf.kinxzone.com/webfile/product/7/7273/kl69nl3lk448.jpg",
      },
      {
        "음식": "탕수육",
        "가격": "9,500",
        "사진":
            "https://1801889e95b1f9bf.kinxzone.com/webfile/product/7/7273/kl69nl3lk448.jpg",
      },
    ],
    "일식": [
      {
        "음식": "초밥",
        "가격": "10,000",
        "사진":
            "https://1801889e95b1f9bf.kinxzone.com/webfile/product/7/7273/kl69nl3lk448.jpg",
      },
      {
        "음식": "라멘",
        "가격": "8,500",
        "사진":
            "https://1801889e95b1f9bf.kinxzone.com/webfile/product/7/7273/kl69nl3lk448.jpg",
      },
    ],
  };
  int selectedMenuIndex = 0;

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
                    onPressed: () {},
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
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 20,
                        mainAxisExtent: 200,
                        mainAxisSpacing: 20,
                      ),
                      itemCount:
                          foodItems[menuCategories[selectedMenuIndex]]!.length,
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
