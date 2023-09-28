import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Screen",
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
