import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
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
