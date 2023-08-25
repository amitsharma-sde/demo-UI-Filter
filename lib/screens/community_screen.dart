import 'package:demo_project/utils/constants.dart';
import 'package:demo_project/widgets/customtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          elevation: .2,
          title: CustomTextWidget(
            "Community",
            fontWeight: FontWeight.bold,
            textColor: kTextColor,
          ),
          // foregroundColor: kPrimaryColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(18.h),
          child: Column(
            children: [
              Container(
                height: 52.h,
                width: 1.sw,
                margin: EdgeInsets.only(bottom: 26.h),
                child: TextFormField(
                    cursorColor: kPrimaryColor,
                    controller: null,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: kGrey400,
                      ),
                      hintText: "Search here...",
                      hintStyle: TextStyle(color: kGrey400, fontSize: 14.sp),
                      fillColor: kGrey50,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: kGrey100,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: kGrey50,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onTap: () {}),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomTextWidget(
                    "Medical Science",
                    fontWeight: FontWeight.bold,
                    textColor: kTextColor,
                  ),
                  SizedBox(width: 12.w),
                  CustomTextWidget(
                    "${_dataList.length} Members",
                    fontSize: 16.sp,
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Expanded(
                child: ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _dataList.length,
                  itemBuilder: (context, index) {
                    var item = _dataList[index];
                    return Row(
                      children: [
                        Container(
                          height: 48.h,
                          width: 48.h,
                          margin: EdgeInsets.fromLTRB(0, 12.h, 16.w, 12.h),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.shade50,
                              borderRadius: BorderRadius.circular(50.r)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: item['profileImg'] == "" ||
                                    item['profileImg'] == null
                                ? Icon(Icons.person_outline)
                                : Image.asset(
                                    item['profileImg'] ?? "",
                                    height: 48.h,
                                    width: 48.h,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
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
                                  item["category"],
                                  fontSize: 14.sp,
                                ),
                                Visibility(
                                    visible: _dataList[index]["country"] ==
                                                "" ||
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
                                            size: 24.h,
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        CustomTextWidget(
                                          item["country"] ?? "",
                                          fontSize: 14.sp,
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List _dataList = [
    {
      "profileImg": "assets/images/doctor1.png",
      "name": "Robert Jhon",
      "category": "Anatomy Student",
      "country": "Australia",
    },
    {
      "profileImg": "assets/images/doctor2.png",
      "name": "Lora Croft",
      "category": "Anatomy Student",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor3.png",
      "name": "Sophia Clark",
      "category": "Doctor of Medicine(MD)",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor4.png",
      "name": "Diego Franandis",
      "category": "Anatomy Student",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor5.png",
      "name": "Naomi Drek",
      "category": "Doctor of Medicine(MD)",
      "country": null,
    },
    {
      "profileImg": "assets/images/doctor1.png",
      "name": "Robert Jhon",
      "category": "Anatomy Student",
      "country": "Australia",
    },
    {
      "profileImg": "assets/images/doctor2.png",
      "name": "Lora Croft",
      "category": "Anatomy Student",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor3.png",
      "name": "Sophia Clark",
      "category": "Doctor of Medicine(MD)",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor4.png",
      "name": "Diego Franandis",
      "category": "Anatomy Student",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor5.png",
      "name": "Naomi Drek",
      "category": "Doctor of Medicine(MD)",
      "country": null,
    },
    {
      "profileImg": "assets/images/doctor1.png",
      "name": "Robert Jhon",
      "category": "Anatomy Student",
      "country": "Australia",
    },
    {
      "profileImg": "assets/images/doctor2.png",
      "name": "Lora Croft",
      "category": "Anatomy Student",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor3.png",
      "name": "Sophia Clark",
      "category": "Doctor of Medicine(MD)",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor4.png",
      "name": "Diego Franandis",
      "category": "Anatomy Student",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor5.png",
      "name": "Naomi Drek",
      "category": "Doctor of Medicine(MD)",
      "country": null,
    },
    {
      "profileImg": "assets/images/doctor1.png",
      "name": "Robert Jhon",
      "category": "Anatomy Student",
      "country": "Australia",
    },
    {
      "profileImg": "assets/images/doctor2.png",
      "name": "Lora Croft",
      "category": "Anatomy Student",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor3.png",
      "name": "Sophia Clark",
      "category": "Doctor of Medicine(MD)",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor4.png",
      "name": "Diego Franandis",
      "category": "Anatomy Student",
      "country": "Namibia",
    },
    {
      "profileImg": "assets/images/doctor5.png",
      "name": "Naomi Drek",
      "category": "Doctor of Medicine(MD)",
      "country": null,
    },
  ];
}
