import 'package:contest_app/ui/tab/quiz/widgets/option_container.dart';
import 'package:contest_app/ui/tab/rating/widgets/rating_appbar.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../blocs/categories_bloc/categories_bloc.dart';
import '../../../blocs/categories_bloc/categories_state.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return RatingAppBar(
            title: "Test",
            subtitle: "Payg’ambarlikdan oldingi davr",
            image: AppIcons.image2,
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                SizedBox(height: 40 * height / 812),
                Row(
                  children: [
                    Text(
                      "Savol#1",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          fontFamily: "Urbanist",
                          color: AppColors.C_007BEC),
                    ),
                  ],
                ),
                SizedBox(height: 20 * height / 812),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.white),
                  child: Center(
                    child: Text(
                      "Rosululloh Sollallohu alayhi vasallam qachon tug'ilganlar?",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          fontFamily: "Urbanist",
                          color: AppColors.black),
                    ),
                  ),
                ),
                SizedBox(height: 20 * height / 812),
                OptionContainer(
                  borderColor: Border.all(color: Colors.green),
                  option: "A.",
                  questionText: "571 -yil Robbiul-avval 12",
                  icon: Icon(CupertinoIcons.check_mark_circled_solid,
                      color: Colors.green, size: 26.r),
                ),
                SizedBox(height: 12 * height / 812),
                OptionContainer(
                  borderColor: Border.all(color: Colors.red),
                  option: "B.",
                  questionText: "571 -yil Robbiul-avval 17",
                  icon: Icon(CupertinoIcons.clear_circled_solid,
                      color: Colors.red, size: 26.r),
                ),
                SizedBox(height: 12 * height / 812),
                OptionContainer(
                  borderColor: Border.all(color: Colors.grey),
                  option: "C.",
                  questionText: "571-yil Ramazon 10",
                  icon: Container(
                    width: 26.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      border: Border.all(color: Colors.grey)
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
