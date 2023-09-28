import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
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
