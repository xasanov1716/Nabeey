import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tabriklaymiz!',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
                fontFamily: "Urbanist",
                color: AppColors.C_111111,),),
          SizedBox(height: 20.h,),
          Image.asset(AppIcons.sertifikat,width: 128.w,height: 181.h,),
          SizedBox(height: 20.h,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColors.C_111111.withOpacity(0.1))
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w,top: 10.h,bottom: 10.h,right: 30.w),
              child: Text("To'g'ri javoblar soni: 28",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    fontFamily: "Urbanist",
                    color: AppColors.C_25BA00),),
            ),
          ),
          SizedBox(height: 12.h,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColors.C_111111.withOpacity(0.1))
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w,top: 10.h,bottom: 10.h,right: 30.w),
              child: Text("Noto'g'ri javoblar soni:  2",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    fontFamily: "Urbanist",
                    color: AppColors.C_D90000),),
            ),
          )
        ]
      ),
    );
  }
}
