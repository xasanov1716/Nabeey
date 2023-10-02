import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({super.key, required this.rating, required this.name, required this.ratingBall, required this.isSelected});
  final int rating;
  final String name;
  final String ratingBall;
  final bool isSelected;



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 1, color: AppColors.C_F59C16),
        color: isSelected ? AppColors.C_F59C16 : AppColors.white,
      ),      
      child: Row(children: [
        Text("${rating+1}.", style: TextStyle(color: isSelected ? AppColors.white : AppColors.C_111111, fontSize: 18.sp, fontWeight: FontWeight.w500),),
        SizedBox(width: 12.w,),
        Expanded(child: Text(name, style: TextStyle(color: isSelected ? AppColors.white : AppColors.C_111111, fontSize: 18.sp, fontWeight: FontWeight.w500,),overflow: TextOverflow.ellipsis,)),
        Container(
          height: 36.w,
          width: 36.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? AppColors.white : AppColors.C_F59C16
          ),
          child: Center(
            child: Text(ratingBall, style: TextStyle(
              color: isSelected ? AppColors.C_F59C16 : AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp
            ),),
          ),
        )
      ],),
    );
  }
}
