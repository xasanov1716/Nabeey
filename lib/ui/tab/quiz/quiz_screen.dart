import 'package:contest_app/ui/tab/profile/widgets/global_button.dart';
import 'package:contest_app/ui/tab/quiz/widgets/option_container.dart';
import 'package:contest_app/ui/tab/quiz/widgets/page_view_column.dart';
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
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
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
                          ],
                        ),
                      ),
                      SizedBox(height: 20 * height / 812),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Center(
                          child: Text(
                            "Rosululloh Sollallohu alayhi vasallam qachon tug'ilganlar?",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              fontFamily: "Urbanist",
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20 * height / 812),
                      SizedBox(
                        height: 400,
                        child: PageView(
                          children: [
                            ...List.generate(10, (index) => PageViewColumn())
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
                  child: GlobalButton(text: "Keyingi", onTap: () {}, color: AppColors.white),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
