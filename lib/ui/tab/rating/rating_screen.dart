import 'package:contest_app/blocs/rating_bloc/rating_bloc.dart';
import 'package:contest_app/ui/tab/rating/widgets/rating_appbar.dart';
import 'package:contest_app/ui/tab/rating/widgets/rating_item.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/icons.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int userId = -1;

  @override
  void initState() {
    BlocProvider.of<RatingBloc>(context).add(GetRatingEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RatingAppBar(
        title: "Reyting",
        subtitle: "Nabeey foydalanuvchilar bo’yicha reyting",
        image: AppIcons.quizImage,
        body: BlocBuilder<RatingBloc, RatingStates>(
          builder: (context, state){
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                SizedBox(height: 32.h,),
                 userId == 1 ? Text("Siz 3 o’rindasiz!", style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 22.sp,
                    color: AppColors.C_F59C16
                ),) : TextButton(onPressed: (){ }, child: Text("Siz ro'yxatdan o'tmagansiz!", style: TextStyle(
                     fontWeight: FontWeight.w800,
                     fontSize: 18.sp,
                     color: AppColors.C_F59C16
                 ),)),
                SizedBox(height: 14.h,),
                ...List.generate(state.ratings.length, (index) => RatingItem(rating: index, name: "${state.ratings[index].userModel.firstName} ${state.ratings[index].userModel.lastName}", ratingBall: "${state.ratings[index].ball}", isSelected: index==userId))
              ],
            );
          },
        ),
      ),
    );
  }
}
