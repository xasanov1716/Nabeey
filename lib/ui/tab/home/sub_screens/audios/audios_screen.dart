import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lorem Ipsum",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.C_111111),
        ),
      ),

      body: Column(
        children: [

        ],
      ),
    );
  }
}
