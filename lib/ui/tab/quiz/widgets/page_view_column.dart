import 'package:contest_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'option_container.dart';

class PageViewColumn extends StatelessWidget {
  const PageViewColumn({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    int trueAnswer=0;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Savol#$index",
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
            4,
            (index) => OptionContainer(
              onTap: (){},
              borderColor: Border.all(color: index==2?Colors.red:trueAnswer==index?Colors.green:Colors.grey),
              option: "${String.fromCharCode(65+index)}.",
              questionText: "571 -yil Robbiul-avval 12",
              icon: Icon(
                index==2?CupertinoIcons.clear_circled_solid:trueAnswer==index?CupertinoIcons.check_mark_circled_solid:CupertinoIcons.circle,
                color: index==2?Colors.red:trueAnswer==index?Colors.green:Colors.grey,
                size: 26.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
