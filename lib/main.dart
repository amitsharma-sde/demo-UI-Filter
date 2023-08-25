import 'dart:async';
import 'package:demo_project/mytabs_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

void main() {
  runApp(const DemoProject());
}

class DemoProject extends StatelessWidget {
  const DemoProject({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(427, 784),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Ivan Infotech',
        builder: (context, child) {
          return MediaQuery(data: MediaQuery.of(context), child: child!);
        },
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.offAll(() => MyTabBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 120.h,
        ),
      ),
    );
  }
}
