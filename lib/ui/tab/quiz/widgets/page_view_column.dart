import 'package:contest_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'option_container.dart';

class PageViewColumn extends StatelessWidget {
  const PageViewColumn({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Savol#1",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              fontFamily: "Urbanist",
              color: AppColors.C_007BEC,
            ),
          ),
          SizedBox(height: 20 * height / 812),
          Text(
            "Rosululloh Sollallohu alayhi vasallam qachon tug'ilganlar?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              fontFamily: "Urbanist",
              color: AppColors.black,
            ),
          ),
          ...List.generate(
            3,
            (index) => OptionContainer(
              onTap: () {},
              borderColor: Border.all(color: Colors.green),
              option: "A.",
              questionText: "571 -yil Robbiul-avval 12",
              icon: Icon(
                CupertinoIcons.check_mark_circled_solid,
                color: Colors.green,
                size: 26.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
