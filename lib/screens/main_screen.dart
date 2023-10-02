import 'package:eatsim/screens/login_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void onPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF8C044),
          leadingWidth: 750,
          leading: Row(
            children: [
              const SizedBox(width: 50),
              SizedBox(width: 50, child: Image.asset('assets/images/logo.png')),
              const SizedBox(width: 50),
              const SizedBox(
                width: 600,
                child: TabBar(
                  automaticIndicatorColorAdjustment: false,
                  indicatorColor: Color(0xffF8C044),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: "INSTORE"),
                    Tab(text: "MENU"),
                    Tab(text: "REVIEW"),
                    Tab(text: "DATA"),
                    Tab(text: "PROFILE"),
                  ],
                ),
              )
            ],
          ),
          actions: [
            Container(
              width: 100,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.black, width: 1)),
                ),
                child: const Text(
                  '종료',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 50),
          ],
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(child: Text("INSTORE")),
            Center(child: Text("MENU")),
            Center(child: Text("REVIEW")),
            Center(child: Text("DATA")),
            Center(child: Text("PROFILE")),
          ],
        ),
      ),
    );
  }
}
