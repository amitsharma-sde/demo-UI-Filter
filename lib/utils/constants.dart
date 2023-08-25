import 'package:demo_project/widgets/customtext_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kPrimaryColor = Color.fromARGB(232, 48, 10, 216);
const kTextColor = Color(0xFF333333);
const kRedColor = Color(0xFFF22D2F);
const kGreyColor = Color(0xFF959595);
const kGreyDark = Color.fromARGB(255, 112, 108, 108);
const kWhiteColor = Color(0xFFFFFFFF);
final kGrey400 = Colors.grey.shade400;
final kGrey50 = Colors.grey.shade50;
final kGrey100 = Colors.grey.shade100;
final kGrey200 = Colors.grey.shade200;

/* --------------custom button--------------- */
Widget customButton({
  String? text,
  required Function() onPressed,
  Color? btnColor,
  Color? textColor,
}) {
  return Container(
    height: 48.h,
    width: 1.sw,
    margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: btnColor ?? kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: kPrimaryColor, width: 2),
          ),
        ),
        onPressed: onPressed,
        child: CustomTextWidget(
          text ?? '',
          textColor: textColor ?? kWhiteColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        )),
  );
}
