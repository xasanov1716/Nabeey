import 'package:contest_app/ui/tab/quiz/widgets/page_view_column.dart';
import 'package:contest_app/ui/tab/quiz/widgets/quiz_result_page.dart';
import 'package:contest_app/ui/tab/rating/widgets/rating_appbar.dart';
import 'package:contest_app/ui/widgets/global_button.dart';
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
  PageController pageViewController = PageController();

  int activeIndex = 0;

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
                          controller: pageViewController,
                          onPageChanged: (value) => activeIndex,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            ...List.generate(
                                3, (index) => const PageViewColumn()),
                            const QuizResultPage(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Visibility(
                    visible: activeIndex != 3,
                    child: GlobalButton(
                      onTap: () {
                        setState(() {});
                        if (activeIndex < 3) {
                          activeIndex++;
                          pageViewController.animateToPage(activeIndex,
                              duration: activeIndex == 3
                                  ? const Duration(seconds: 1)
                                  : const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      },
                      title: "Keyingi",
                      color: AppColors.C_F59C16,
                      textColor: AppColors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Visibility(
                    visible: activeIndex == 3,
                    child: GlobalButton(
                      onTap: () {
                        setState(() {});
                        if (activeIndex < 3) {
                          activeIndex++;
                          pageViewController.animateToPage(activeIndex,
                              duration: activeIndex == 3
                                  ? const Duration(seconds: 1)
                                  : const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      },
                      title: "Reyting ko'rish",
                      color: AppColors.C_F59C16,
                      textColor: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16 * height / 812),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 22.h, left: 20.w, right: 20.w),
                  child: Visibility(
                    visible: activeIndex == 3,
                    child: GlobalButton(
                      onTap: () {
                        setState(() {});
                        if (activeIndex < 3) {
                          activeIndex++;
                          pageViewController.animateToPage(activeIndex,
                              duration: activeIndex == 3
                                  ? const Duration(seconds: 1)
                                  : const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      },
                      borderColor: AppColors.C_F59C16,
                      title: "Reyting ko'rish",
                      color: AppColors.white,
                      textColor: AppColors.C_F59C16,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
