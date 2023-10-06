import 'package:contest_app/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:contest_app/ui/tab/quiz/widgets/page_view_column.dart';
import 'package:contest_app/ui/tab/quiz/widgets/quiz_result_page.dart';
import 'package:contest_app/ui/tab/rating/widgets/rating_appbar.dart';
import 'package:contest_app/ui/widgets/global_button.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizQuestionsScreen extends StatefulWidget {
  const QuizQuestionsScreen({super.key, required this.index});

  final int index;

  @override
  State<QuizQuestionsScreen> createState() => _QuizQuestionsScreenState();
}

class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {

  PageController pageViewController = PageController();
  ScrollController controller = ScrollController();

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {},
        builder: (context, state) {
            return RatingAppBar(
              title: state.quizModel[widget.index].name,
              subtitle: state.quizModel[widget.index].description,
              image: AppIcons.image2,
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      controller: controller,
                      children: [
                        SizedBox(
                          height: 500,
                          child: PageView(
                            controller: pageViewController,
                            onPageChanged: (value) => activeIndex,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ...List.generate(
                                  state.questionModel.length,
                                  (index) => PageViewColumn(
                                    questionModel: state.questionModel[index],
                                        index: index,
                                      )),
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
                      visible: activeIndex != state.questionModel.length,
                      child: GlobalButton(
                        onTap: () {
                          if(1==2)
                          setState(() {});
                          if (activeIndex < state.questionModel.length) {
                            activeIndex++;
                            pageViewController.animateToPage(activeIndex,
                                duration: activeIndex == state.questionModel.length
                                    ? const Duration(seconds: 1)
                                    : const Duration(milliseconds: 500),
                                curve: Curves.linear);
                          }
                          controller.animateTo(
                              controller.position.minScrollExtent,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeOut);
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
                      visible: activeIndex == state.questionModel.length,
                      child: GlobalButton(
                        onTap: () {},
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
                      visible: activeIndex == state.questionModel.length,
                      child: GlobalButton(
                        onTap: () {},
                        borderColor: AppColors.C_F59C16,
                        title: "Bosh sahifaga o’tish",
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
