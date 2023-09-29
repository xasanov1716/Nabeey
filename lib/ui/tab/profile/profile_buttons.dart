import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileButton extends StatelessWidget {
  final String suffixIcon;
  final String prefixIcon;
  final String text;
  final VoidCallback? onTap;

  const ProfileButton({super.key,
    required this.suffixIcon,
    required this.prefixIcon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  prefixIcon,
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(width: 10.w),
                Text(text),
              ],
            ),
            SvgPicture.asset(
              suffixIcon,
              width: 24.w,
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
