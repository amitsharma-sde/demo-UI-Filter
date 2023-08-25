import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final int? maxLine;
  final TextAlign align;
  final double? height;
  CustomTextWidget(this.text,
      {super.key,
      this.fontSize,
      this.fontWeight,
      this.textColor = Colors.grey,
      this.maxLine = 1,
      this.align = TextAlign.left,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLine,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize ?? 18.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        height: height,
      ),
    );
  }
}
