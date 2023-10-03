import 'package:contest_app/ui/tab/rating/widgets/rating_appbar.dart';
import 'package:contest_app/ui/tab/rating/widgets/rating_item.dart';
import 'package:contest_app/ui/widgets/global_app_bar.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/icons.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RatingAppBar(
        title: "Reyting",
        subtitle: "Nabeey foydalanuvchilar bo’yicha reyting",
        image: AppIcons.quizImage,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            SizedBox(height: 32.h,),
            Text("Siz 3 o’rindasiz!", style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22.sp,
              color: AppColors.C_F59C16
            ),),
            SizedBox(height: 14.h,),
            ...List.generate(30, (index) => RatingItem(rating: index, name: "Dilshodbek Sayitqulov", ratingBall: "${153-5*index}", isSelected: index==2))
          ],
        ),
      ),
    );
  }
}
