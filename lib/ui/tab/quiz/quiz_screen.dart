import 'package:contest_app/blocs/quizzes_bloc/quizzes_bloc.dart';
import 'package:contest_app/data/models/status/form_status.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgtes/ansver_selected.dart';
import 'widgtes/global_button.dart';
import 'widgtes/text_widgets.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    context.read<QuizzesBloc>().add(GetAllQuizzes());
    super.initState();
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: BlocConsumer<QuizzesBloc, QuizzesState>(
      builder: (BuildContext context, QuizzesState state) {
        if (state.status == FormStatus.success) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  itemCount: state.quiz.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TextWidgets(
                          text: state.quiz[count].question.text,
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: height * (20 / 812),
                        ),
                        ...List.generate(
                          state.quiz[count].question.answers.length,
                          (index) => Align(
                              alignment: Alignment.centerLeft,
                              child: AnswerSelect(
                                text:
                                    "A.${state.quiz[count].question.answers[index].text}",
                              )),
                        )
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.8, left: width * 0.05, right: width * 0.05),
                child: GlobalButton(
                  text: 'Keyingi',
                  onTap: () {
                    setState(() {
                      count++;
                      if (count == state.quiz.length) count = 0;
                    });
                  },
                ),
              ),
            ],
          );
        }
        return Text("Something wen wrong: Current status:${state.status.name}");
        ;
      },
      listener: (BuildContext context, QuizzesState state) {},
    ));
  }
}
