import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.text, required this.onTap, required this.color});

  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: height * (56 / 812),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.C_F59C16,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(text,style: TextStyle(fontFamily: "Urbanist",fontSize: 18.sp,fontWeight: FontWeight.w600,color: color),)),
      ),
    );
  }
}
