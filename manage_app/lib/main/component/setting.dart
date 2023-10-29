import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_app/auth/login.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFD6E2EA),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      Text(
                        'Menu',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Spacer(),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.grey.withOpacity(0.3)),
                        child: const Icon(Icons.settings),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        width: 30.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.grey.withOpacity(0.3)),
                        child: const Icon(Icons.search),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Container(
                    width: size.width,
                    height: 60.h,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Row(children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Image.asset('assets/images/avatar.jpeg')),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Phước Hoàng',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 18.h),
                        ),
                        const Spacer(),
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.white),
                          child: const Icon(Icons.settings),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.white),
                          child: const Icon(Icons.arrow_drop_down),
                        )
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      Container(
                        width: (size.width - 30.w) / 2,
                        height: 70.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                      ),
                      const Spacer(),
                      Container(
                        width: (size.width - 30.w) / 2,
                        height: 70.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      Container(
                        width: (size.width - 30.w) / 2,
                        height: 70.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                      ),
                      const Spacer(),
                      Container(
                        width: (size.width - 30.w) / 2,
                        height: 70.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      Container(
                        width: (size.width - 30.w) / 2,
                        height: 70.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                      ),
                      const Spacer(),
                      Container(
                        width: (size.width - 30.w) / 2,
                        height: 70.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      Container(
                        width: (size.width - 30.w) / 2,
                        height: 70.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                      ),
                      const Spacer(),
                      Container(
                        width: (size.width - 30.w) / 2,
                        height: 70.h,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: size.width - 20.w,
                  height: 30.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blueGrey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      'Xem thêm',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: size.width - 20.w,
                  height: 1.h,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      const Icon(Icons.help_outline_rounded),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Trợ giúp & hỗ trợ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 18.h),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: size.width - 20.w,
                  height: 1.h,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      const Icon(Icons.settings_outlined),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Cài đặt & quyền riêng tư',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 18.h),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: size.width - 20.w,
                  height: 1.h,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Thông tin về chúng tôi',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 18.h),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: size.width - 20.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage())),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueGrey),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      'Đăng xuất',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                )
              ],
            ),
          )),
    );
  }
}
