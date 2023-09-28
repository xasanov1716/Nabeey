import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GlobalContainer extends StatelessWidget {
  const GlobalContainer(
      {super.key,
      required this.image,
      required this.imageEdit,
      required this.text,
      required this.color,
      required this.textColor});

  final String image;
  final String imageEdit;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * (156 / 375),
      height: height * (114 / 812),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: color,
        boxShadow: const [
          BoxShadow(color: Colors.grey, spreadRadius: -4, blurRadius: 7),
        ],
      ),
      child: Stack(
        children: [
          SvgPicture.asset(image, width: double.infinity),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * (25 / 812)),
                SvgPicture.asset(imageEdit),
                SizedBox(height: height * (15 / 812)),
                Text(
                  text,
                  style: TextStyle(
                      fontFamily: "Urbanist",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: textColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
