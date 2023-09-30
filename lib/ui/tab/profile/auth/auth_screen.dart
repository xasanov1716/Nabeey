import 'package:contest_app/ui/widgets/global_button.dart';
import 'package:contest_app/ui/widgets/global_textfield.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 20.h,
        elevation: 0,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quiz da qatnashish uchun ",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.C_007BEC),
                    ),
                    Text(
                      "Ro’yhatdan o’ting",
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.C_111111),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    const GlobalTextField(
                        hintText: "Username",
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        caption: "Ism"),
                    const GlobalTextField(
                        hintText: "Lastname",
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        caption: "Familya"),
                    const GlobalTextField(
                        hintText: "+(998) 91 234-56-78",
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        caption: "Tel raqam"),
                    const GlobalTextField(
                        hintText: "********",
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        caption: "Parol"),
                    SizedBox(
                      height: 24.h,
                    ),
                    GlobalButton(
                      title: "Ro’yhatdan o’tish",
                      onTap: () {},
                      color: AppColors.C_F59C16,
                      textColor: AppColors.white,
                    ),
                    SizedBox(height: 40.h,),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
