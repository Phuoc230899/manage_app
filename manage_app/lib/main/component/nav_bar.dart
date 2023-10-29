import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget(
      {super.key, required this.currentPage, required this.onTabTapped});
  final int currentPage;
  final ValueChanged<int> onTabTapped;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        height: 50.0.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50.0.h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined),
                    onPressed: () => onTabTapped(0),
                    color: currentPage == 0 ? Colors.blueGrey : Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark_outline_outlined),
                    onPressed: () => onTabTapped(1),
                    color: currentPage == 1 ? Colors.blueGrey : Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () => onTabTapped(2),
                    color: currentPage == 2 ? Colors.blueGrey : Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined),
                    onPressed: () => onTabTapped(3),
                    color: currentPage == 3 ? Colors.blueGrey : Colors.grey,
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 50.0.h,
            //   width: MediaQuery.of(context).size.width / 2 - 40.0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       IconButton(
            //         icon: const Icon(Icons.notifications_outlined),
            //         onPressed: () => onTabTapped(2),
            //         color: currentPage == 2 ? Colors.blueGrey : Colors.grey,
            //       ),
            //       IconButton(
            //         icon: const Icon(Icons.settings_outlined),
            //         onPressed: () => onTabTapped(3),
            //         color: currentPage == 3 ? Colors.blueGrey : Colors.grey,
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
