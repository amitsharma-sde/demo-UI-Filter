import 'package:demo_project/utils/constants.dart';
import 'package:demo_project/widgets/customtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int _selectedIndex = 0;
  var item;

  @override
  void initState() {
    super.initState();
    filterData;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kWhiteColor,
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: customButton(
                  btnColor: kWhiteColor,
                  textColor: kPrimaryColor,
                  text: 'Cancel',
                  onPressed: () {
                    Get.back();
                  })),
          Expanded(
            child: customButton(
              text: 'Apply',
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: .2,
        leadingWidth: 0,
        title: Row(children: [
          Container(
            width: 30.h,
            height: 30.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: kGrey100,
            ),
            padding: EdgeInsets.only(left: 8.h),
            margin: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              child: Icon(
                Icons.arrow_back_ios,
                color: kTextColor,
                size: 18.sp,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          CustomTextWidget(
            "Filter",
            fontWeight: FontWeight.bold,
            textColor: kTextColor,
          ),
          Spacer(),
          TextButton(
            child: CustomTextWidget(
              "Clear All",
              fontWeight: FontWeight.bold,
              textColor: kPrimaryColor.withOpacity(.6),
            ),
            onPressed: () {},
          ),
        ]),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: .45.sw,
            height: 1.sh,
            color: kGrey50,
            child: ListView.builder(
              itemCount: filterData.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var item = filterData[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                      width: .45.sw,
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: kGrey200))),
                      child: CustomTextWidget(
                        item['title'],
                        textColor: _selectedIndex == index
                            ? kPrimaryColor
                            : kTextColor,
                        fontWeight: FontWeight.w500,
                      )),
                );
              },
            ),
          ),
          if (filterData.isNotEmpty)
            Container(
              width: .55.sw,
              color: kWhiteColor,
              child: ListView.builder(
                itemCount: filterData[_selectedIndex]['data'].length,
                shrinkWrap: true,
                primary: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, j) {
                  var item = filterData[_selectedIndex]['data'][j];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        item['isCheck'] = !item['isCheck'];
                      });
                    },
                    child: Container(
                        width: .55.sw,
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            border:
                                Border(bottom: BorderSide(color: kGrey200))),
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h, horizontal: 16.w),
                        child: Row(
                          children: [
                            CustomTextWidget(
                              item['name'],
                              textColor:
                                  item['isCheck'] ? kPrimaryColor : kGreyColor,
                              fontWeight: FontWeight.w500,
                            ),
                            Spacer(),
                            if (item['isCheck'])
                              Icon(
                                Icons.done,
                                color: kPrimaryColor,
                                size: 20.sp,
                              )
                          ],
                        )),
                  );
                },
              ),
            ),
        ],
      ),
    ));
  }

  List filterData = [
    {
      "title": "Subcategories",
      "data": [
        {"id": "1", "name": "Medical Science", "isCheck": false},
        {"id": "2", "name": "Anatomy", "isCheck": false},
        {"id": "3", "name": "Space Science", "isCheck": false},
        {"id": "4", "name": "Micro Biology", "isCheck": false},
        {"id": "5", "name": "Botany", "isCheck": false},
        {"id": "6", "name": "Zoology", "isCheck": false},
        {"id": "7", "name": "Medical Science", "isCheck": false},
        {"id": "8", "name": "Anatomy", "isCheck": false},
        {"id": "9", "name": "Space Science", "isCheck": false},
        {"id": "10", "name": "Micro Biology", "isCheck": false},
        {"id": "11", "name": "Botany", "isCheck": false},
        {"id": "12", "name": "Zoology", "isCheck": false},
        {"id": "13", "name": "Micro Biology", "isCheck": false},
        {"id": "14", "name": "Botany", "isCheck": false},
        {"id": "15", "name": "Zoology", "isCheck": false},
        {"id": "16", "name": "Micro Biology", "isCheck": false},
        {"id": "17", "name": "Botany", "isCheck": false},
        {"id": "18", "name": "Zoology", "isCheck": false},
        {"id": "19", "name": "Micro Biology", "isCheck": false},
        {"id": "20", "name": "Botany", "isCheck": false},
        {"id": "21", "name": "Zoology", "isCheck": false}
      ]
    },
    {
      "title": "Location",
      "data": [
        {"id": "1", "name": "Kolkata", "isCheck": false},
        {"id": "2", "name": "Durgapur", "isCheck": false},
        {"id": "3", "name": "Raniganj", "isCheck": false}
      ]
    },
  ];
}
