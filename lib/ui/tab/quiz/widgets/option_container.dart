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
    return Column(
      children: [
        SizedBox(height: 20 * height / 812),
        Container(
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
        ),
      ],
    );
  }
}
// SizedBox(height: 20 * height / 812),
// OptionContainer(
//   onTap: () {},
//   borderColor: Border.all(color: Colors.green),
//   option: "A.",
//   questionText: "571 -yil Robbiul-avval 12",
//   icon: Icon(
//     CupertinoIcons.check_mark_circled_solid,
//     color: Colors.green,
//     size: 26.r,
//   ),
// ),
// SizedBox(height: 12 * height / 812),
// OptionContainer(
//   onTap: () {},
//   borderColor: Border.all(color: Colors.red),
//   option: "B.",
//   questionText: "571 -yil Robbiul-avval 17",
//   icon: Icon(
//     CupertinoIcons.clear_circled_solid,
//     color: Colors.red,
//     size: 26.r,
//   ),
// ),
// SizedBox(height: 12 * height / 812),
// OptionContainer(
//   onTap: () {},
//   borderColor: Border.all(color: Colors.grey),
//   option: "C.",
//   questionText: "571-yil Ramazon 10",
//   icon: Container(
//     width: 26.w,
//     height: 26.h,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(100.r),
//       border: Border.all(color: Colors.grey),
//     ),
//   ),
// ),
// SizedBox(height: 12 * height / 812),
// OptionContainer(
//   onTap: () {},
//   borderColor: Border.all(color: Colors.grey),
//   option: "D.",
//   questionText: "571-yil Rajab 10",
//   icon: Container(
//     width: 26.w,
//     height: 26.h,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(100.r),
//       border: Border.all(color: Colors.grey),
//     ),
//   ),
// ),