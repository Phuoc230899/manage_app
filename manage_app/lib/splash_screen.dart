import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:manage_app/auth/login.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 4, milliseconds: 250), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  void navigationPage() {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //   builder: (_) => const LoginPage(),
    // ));

    // Navigator.push(
    //   context,
    //   PageRouteBuilder(
    //     pageBuilder: (context, animation, secondaryAnimation) {
    //       return const LoginPage();
    //     },
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       const begin = 0.0;
    //       const end = 1.0;
    //       var tween = Tween(begin: begin, end: end);
    //       var fadeAnimation = animation.drive(tween);

    //       return ScaleTransition(
    //         scale: fadeAnimation,
    //         child: child,
    //       );
    //     },
    //   ),
    // );
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            child: const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      body: Opacity(
          opacity: opacity.value,
          child: Center(child: Lottie.asset('assets/lotties/splash.json'))),
    );
  }
}
