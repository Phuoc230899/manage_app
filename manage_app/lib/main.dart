import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manage_app/auth/login.dart';
import 'package:manage_app/core/theme/app_theme.dart';
import 'package:manage_app/report/report.dart';
import 'package:manage_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.light,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('es', 'ES'),
              Locale('fr', 'FR'),
            ],
            builder: EasyLoading.init(),
            home: const SplashScreenPage(),
          );
        });
  }
}
