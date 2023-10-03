import 'package:contest_app/ui/tab/profile/widgets/global_button.dart';
import 'package:contest_app/ui/tab/quiz/widgets/page_view_column.dart';
import 'package:contest_app/ui/tab/rating/widgets/rating_appbar.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
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
                      SizedBox(
                        height: 500,
                        child: PageView(
                          children: [
                            ...List.generate(2, (index) => const PageViewColumn())
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
