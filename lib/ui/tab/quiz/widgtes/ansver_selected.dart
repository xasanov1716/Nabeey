import 'package:contest_app/utils/colors.dart';
import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerSelect extends StatefulWidget {
  const AnswerSelect({super.key, required this.text});
  final String text;

  @override
  State<AnswerSelect> createState() => _AnswerSelectState();
}

class _AnswerSelectState extends State<AnswerSelect> {
  bool selected = false;
  bool selectedOne=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      //width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: selected
              ? AppColors.c_D9D9D9
              : (selectedOne? AppColors.C_25BA00 : AppColors.C_D90000),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.text,style: Theme.of(context).textTheme.titleMedium,),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  selected=!selected;
                  selectedOne=!selectedOne;
                });
              },
              icon: selected
                  ? SvgPicture.asset(AppIcons.ellipse)
                  : (selectedOne
                      ? SvgPicture.asset(AppIcons.correctAnswer)
                      : SvgPicture.asset(AppIcons.incorrectAnswer))),
        ],
      ),
    );
  }
}