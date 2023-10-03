import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionContainer extends StatefulWidget {
  const OptionContainer(
      {super.key,
      required this.option,
      required this.questionText,
      required this.icon,
      required this.borderColor,
      required this.onTap});

  final String option;
  final String questionText;
  final Widget icon;
  final Border borderColor;
  final VoidCallback onTap;

  @override
  State<OptionContainer> createState() => _OptionContainerState();
}

class _OptionContainerState extends State<OptionContainer> {
  int isSelected=0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: AppColors.white,
          border: widget.borderColor),
      child: ListTile(
          onTap: widget.onTap,
          minLeadingWidth: 0,
          contentPadding: EdgeInsets.zero,
          leading: Text(
            widget.option,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                fontFamily: "Urbanist",
                color: AppColors.black),
          ),
          title: Text(
            widget.questionText,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                fontFamily: "Urbanist",
                color: AppColors.black),
          ),
          trailing: widget.icon),
    );
  }
}
