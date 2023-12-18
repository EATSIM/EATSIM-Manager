class RestaurantData {
  static List<String> menuCategories = ["한식", "중식", "일식"];
  static Map<String, List<Map<String, dynamic>>> foodItems = {
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

  // 메뉴 카테고리 추가 메서드
  static void addMenuCategory(String category) {
    menuCategories.add(category);
  }
}
