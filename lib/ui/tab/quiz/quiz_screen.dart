import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quiz Screen",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.C_111111),
        ),
      ),
    );
  }
}
