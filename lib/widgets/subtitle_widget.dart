import 'package:demo_project/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtitleTextWidget extends StatefulWidget {
  const SubtitleTextWidget({super.key, required this.text});
  final String text;

  @override
  State<SubtitleTextWidget> createState() => _SubtitleTextWidgetState();
}

class _SubtitleTextWidgetState extends State<SubtitleTextWidget> {
  String? _2LineText;
  String? _fullText;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 90) {
      _2LineText = widget.text.substring(0, 90);
      _fullText = widget.text.substring(90, widget.text.length);
    } else {
      _2LineText = widget.text;
      _fullText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: _fullText!.isEmpty
          ? Text(
              _2LineText!,
              style: TextStyle(
                fontSize: 16.sp,
                height: double.parse("1.4"),
              ),
            )
          : RichText(
              text: TextSpan(
                  text:
                      flag ? (_2LineText! + "...") : (_2LineText! + _fullText!),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: kGreyColor,
                    height: double.parse("1.4"),
                  ),
                  children: [
                    TextSpan(
                      text: flag ? " more" : " less",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: kTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
    );
  }
}
