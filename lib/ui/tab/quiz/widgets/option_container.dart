import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({super.key, required this.option, required this.questionText, required this.icon, required this.borderColor});

  final String option;
  final String questionText;
  final Widget icon;
  final Border borderColor;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: AppColors.white,
          border: borderColor),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Text(
          option,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              fontFamily: "Urbanist",
              color: AppColors.black),
        ),
        title: Text(
          questionText,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              fontFamily: "Urbanist",
              color: AppColors.black),
        ),
        trailing: icon
      ),
    );
  }
}
