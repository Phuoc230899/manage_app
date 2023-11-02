import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  bool _isBottomBarVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
      isBottomBarVisible: _isBottomBarVisible,
    );
    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            // Bắt đầu cuộn
          } else if (notification is ScrollUpdateNotification) {
            // Đang cuộn
            if (notification.metrics.extentAfter == 0) {
              // Cuộn xuống dưới cùng - Hiển thị BottomBar
              // setState(() {
              //   _isBottomBarVisible = true;
              // });
            } else if (notification.dragDetails != null &&
                notification.dragDetails!.delta.dy > 0) {
              setState(() {
                _isBottomBarVisible = true;
              });
            } else if (notification.dragDetails != null &&
                notification.dragDetails!.delta.dy < 0) {
              // Cuộn lên - an BottomBar
              setState(() {
                _isBottomBarVisible = false;
              });
            }
          } else if (notification is ScrollEndNotification) {
            // Kết thúc cuộn
          }
          return true;
        },
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: _pages,
        ),
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
