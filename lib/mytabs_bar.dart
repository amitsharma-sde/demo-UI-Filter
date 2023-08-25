import 'package:demo_project/screens/community_screen.dart';
import 'package:demo_project/utils/constants.dart';
import 'package:demo_project/screens/demo_screen.dart';
import 'package:demo_project/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kRedColor,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const DemoScreen());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 1,
        child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10.w),
                  MaterialButton(
                    minWidth: .16.sw,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            const HomeScreen(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 3.h),
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? kPrimaryColor : kGreyColor,
                          size: 24.h,
                        ),
                        SizedBox(height: 3.h),
                        Expanded(
                          child: Text(
                            'Home',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  currentTab == 0 ? kPrimaryColor : kGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: .18.sw,
                    onPressed: () {
                      setState(() {
                        currentScreen = const CommunityScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 3.h),
                        Icon(
                          Icons.people,
                          size: 24.h,
                          color: currentTab == 1 ? kPrimaryColor : kGreyColor,
                        ),
                        SizedBox(height: 3.h),
                        Expanded(
                          child: Text(
                            'Community',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  currentTab == 1 ? kPrimaryColor : kGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: .18.sw,
                    onPressed: () {
                      setState(() {
                        currentScreen = const DemoScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 3.h),
                        Icon(
                          Icons.messenger_rounded,
                          size: 24.h,
                          color: currentTab == 2 ? kPrimaryColor : kGreyColor,
                        ),
                        SizedBox(height: 3.h),
                        Expanded(
                          child: Text(
                            'Messages',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  currentTab == 2 ? kPrimaryColor : kGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: .18.sw,
                    onPressed: () {
                      setState(() {
                        // Get.to(() => const DemoScreen());
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 3.h),
                        Icon(
                          Icons.person,
                          size: 24.h,
                          color: currentTab == 3 ? kPrimaryColor : kGreyColor,
                        ),
                        SizedBox(height: 3.h),
                        Expanded(
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color:
                                  currentTab == 3 ? kPrimaryColor : kGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 10.w),
            ],
          ),
        ),
      ),
    );
  }
}
