import 'package:contest_app/data/models/quiz/quiz_questions_model.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'option_container.dart';

class PageViewColumn extends StatefulWidget {
  const PageViewColumn({super.key, required this.index, required this.questionModel});

  final int index;
  final QuestionModel questionModel;

  @override
  State<PageViewColumn> createState() => _PageViewColumnState();
}

class _PageViewColumnState extends State<PageViewColumn> {
  @override
  Widget build(BuildContext context) {
    int selectAnswer = 0;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Savol#${widget.index + 1}",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              fontFamily: "Urbanist",
              color: AppColors.C_007BEC,
            ),
          ),
          SizedBox(height: 20 * height / 812),
          Text(
            widget.questionModel.text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              fontFamily: "Urbanist",
              color: AppColors.black,
            ),
          ),
          ...List.generate(
            4,
            (index) => OptionContainer(
              onTap: (){
                print("bosildi $index");
                setState(() {
                  selectAnswer = index;
                });
              },
              borderColor: Border.all(color: Colors.grey),
              option: "${String.fromCharCode(65+index)}.",
              questionText: widget.questionModel.answers[index].text,
              icon: Icon(
                CupertinoIcons.circle,
                color: Colors.grey,
                size: 26.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
