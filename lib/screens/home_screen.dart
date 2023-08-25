import 'package:demo_project/utils/constants.dart';
import 'package:demo_project/screens/filter_screen.dart';
import 'package:demo_project/widgets/customtext_widget.dart';
import 'package:demo_project/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: .2,
          title: Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 32.h,
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // Get.to(() => FilterScreen());
                },
                child: Icon(
                  Icons.search,
                  size: 24.h,
                  color: kGreyDark,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: GestureDetector(
                  onTap: () {
                    // Get.to(() => FilterScreen());
                  },
                  child: Icon(
                    Icons.notifications_none,
                    size: 24.h,
                    color: kGreyDark,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => FilterScreen());
                  },
                  child: Icon(
                    Icons.filter_list_rounded,
                    size: 24.h,
                    color: kGreyDark,
                  ),
                ),
              ),
            ],
          ),
          // foregroundColor: kPrimaryColor,
        ),
        body: ListView.separated(
          // physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _dataList.length,
          separatorBuilder: (context, int) {
            return Divider(
              color: kGreyColor,
              thickness: .6,
            );
          },
          itemBuilder: (context, index) {
            var item = _dataList[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item['dept'] == "" || item['dept'] == null
                      ? SizedBox()
                      : Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.h, horizontal: 10.w),
                          margin: EdgeInsets.only(top: 8.h, bottom: 16.h),
                          decoration: BoxDecoration(
                              color: kGrey50,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: CustomTextWidget(
                            item['dept'].toString(),
                            textColor: kTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                  Row(
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.h,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade50,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: item['profileImg'] == "" ||
                                  item['profileImg'] == null
                              ? Icon(Icons.person_outline)
                              : Image.asset(
                                  item['profileImg'],
                                  height: 48.h,
                                  width: 48.h,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            item["name"],
                            textColor: kTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              CustomTextWidget(
                                item["days"],
                                fontSize: 16.sp,
                              ),
                              Visibility(
                                  visible: _dataList[index]["country"] == "" ||
                                          _dataList[index]["country"] == null
                                      ? false
                                      : true,
                                  child: Row(
                                    children: [
                                      Container(
                                        color: kGreyColor.withOpacity(.5),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 8.w),
                                        height: 16.h,
                                        width: 2.w,
                                      ),
                                      RotatedBox(
                                        quarterTurns: 75,
                                        child: Icon(
                                          Icons.bookmark_border_rounded,
                                          color: kGreyColor,
                                          size: 18.h,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      CustomTextWidget(
                                        item["country"],
                                        fontSize: 16.sp,
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 8.h),
                  CustomTextWidget(
                    item["title"],
                    textColor: kTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 8.h),
                  SubtitleTextWidget(text: item['subtitle'] ?? ""),
                  SizedBox(height: 8.h),
                  _dataList[index]["image"] == "" ||
                          _dataList[index]["image"] == null
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(top: 0.h),
                          child: Image.asset(
                            item["image"],
                            width: 1.sw,
                            height: 230.h,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            item['isLiked'] = !item['isLiked'];
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: Icon(
                            item['isLiked']
                                ? Icons.thumb_up_alt
                                : Icons.thumb_up_off_alt,
                            color: item['isLiked'] ? kPrimaryColor : kGreyColor,
                            size: 24.h,
                          ),
                        ),
                      ),
                      CustomTextWidget(
                        item["likes"],
                        fontSize: 14.sp,
                      ),
                      Spacer(),
                      Icon(
                        Icons.messenger_outline_rounded,
                        color: kGreyColor,
                        size: 24.h,
                      ),
                      SizedBox(width: 5.w),
                      CustomTextWidget(
                        item["comment"],
                        fontSize: 14.sp,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List _dataList = [
    {
      "dept": "",
      "profileImg": "",
      "name": "Admin",
      "days": "2 days ago",
      "country": "",
      "title": "Jonas E.Salk developed the which Vaccine?",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "assets/images/doctors.png",
      "likes": "120",
      "isLiked": false,
      "comment": "80 Comments"
    },
    {
      "dept": "Medical",
      "profileImg": "assets/images/doctor1.png",
      "name": "Robert Jhon",
      "days": "2 days ago",
      "country": "Australia",
      "title": "Jonas E.Salk developed the which Vaccine?",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "",
      "likes": "150",
      "isLiked": false,
      "comment": "50 Comments"
    },
    {
      "dept": "Medicine",
      "profileImg": "assets/images/doctor2.png",
      "name": "Test Doctor",
      "days": "2 days ago",
      "country": "Nambia",
      "title": "Jonas E.Salk developed the which Vaccine?",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "assets/images/doctors.png",
      "likes": "100",
      "isLiked": false,
      "comment": "80 Comments"
    },
    {
      "dept": "Surgery",
      "profileImg": "assets/images/doctor3.png",
      "name": "Test Doctor",
      "days": "2 days ago",
      "country": "",
      "title": "Jonas E.Salk developed the which Vaccine?",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "",
      "likes": "100",
      "isLiked": false,
      "comment": "80 Comments"
    },
    {
      "dept": "Medical",
      "profileImg": "assets/images/doctor4.png",
      "name": "Test Doctor",
      "days": "2 days ago",
      "country": "Africa",
      "title": "Jonas E.Salk developed the which Vaccine?",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "assets/images/doctors.png",
      "likes": "100",
      "isLiked": false,
      "comment": "80 Comments"
    },
    {
      "dept": "Surgery",
      "profileImg": "assets/images/doctor5.png",
      "name": "Test Doctor",
      "days": "2 days ago",
      "country": "Africa",
      "title": "Jonas E.Salk developed the which Vaccine?",
      "subtitle":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "assets/images/doctors.png",
      "likes": "100",
      "isLiked": false,
      "comment": "80 Comments"
    },
  ];
}
