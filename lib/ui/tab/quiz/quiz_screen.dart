import 'package:contest_app/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:contest_app/data/models/status/form_status.dart';
import 'package:contest_app/ui/tab/app_routes.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            "Lorem Ipsum",
            style: TextStyle(
                fontFamily: "Urbanist",
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.C_111111),
          ),
        ),
        body: BlocConsumer<QuizBloc, QuizState>(
          listener: (context, state) {
            if (state.status == FormStatus.failure) {
              debugPrint('error');
            }
          },
          builder: (context, state) {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                ...List.generate(
                  state.quizModel.length,
                  (index) => ListTile(
                    onTap: (){
                      context.read<QuizBloc>().add(GetQuizQuestionsByIdEvent(id: state.quizModel[index].id));
                      Navigator.pushNamed(context, RouteNames.quizQuestionsScreen,arguments: index);
                    },
                    title: Text(state.quizModel[index].name,
                        style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.C_111111),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    subtitle: Text(state.quizModel[index].description,
                        style: TextStyle(
                            fontFamily: "Urbanist",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.C_111111),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            );
          },
        ));
  }
}
