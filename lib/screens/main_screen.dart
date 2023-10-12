import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  // 탭 라벨 리스트
  static const List<String> tabLabels = [
    "INSTORE",
    "MENU",
    "REVIEW",
    "DATA",
    "PROFILE",
  ];
  late TabController tabController = TabController(
    length: 5, // 탭의 개수
    vsync: this, // 이 컨트롤러의 애니메이션을 처리할 TickerProvider
    initialIndex: 1, // 초기 탭 인덱스
    animationDuration: const Duration(milliseconds: 0), // 애니메이션 제거
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 740,
        leading: Row(
          children: [
            const SizedBox(width: 40),
            SizedBox(
              width: 50,
              child: Image.asset(Constants.logoImage),
            ),
            const SizedBox(width: 50),
            /* 상단 메뉴바 */
            SizedBox(
              width: 600,
              child: TabBar(
                controller: tabController,
                tabs: tabLabels.map((label) => Tab(text: label)).toList(),
              ),
            )
          ],
        ),
        /* 우측 상단 종료 버튼 */
        actions: [
          Container(
            width: 130,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: Constants.appBarButtonColor,
                    width: 1,
                  ),
                ),
              ),
              child: const Text(
                '종료',
                style: TextStyle(
                  color: Constants.appBarButtonTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
      /* 하단 탭바 뷰 */
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text("INSTORE")),
          Center(child: Text("MENU")),
          Center(child: Text("REVIEW")),
          Center(child: Text("DATA")),
          Center(child: Text("PROFILE")),
        ],
      ),
    );
  }
}
