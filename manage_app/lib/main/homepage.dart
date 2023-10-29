import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_app/main/component/dashboard.dart';
import 'package:manage_app/main/component/nav_bar.dart';
import 'package:manage_app/main/component/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = const [
    DashBoardPage(),
    SettingPage(),
    SettingPage(),
    SettingPage()
  ];
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Widget navbar = NavBarWidget(
      currentPage: _currentPage,
      onTabTapped: (index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
    );
    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: _pages,
        ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {},
      //     backgroundColor: Colors.blueGrey,
      //     child: Icon(
      //       Icons.add,
      //       size: 35.h,
      //     )),
      bottomNavigationBar: navbar,
    );
  }
}
