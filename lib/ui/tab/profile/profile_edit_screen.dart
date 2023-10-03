import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../widgets/global_button.dart';
import '../../widgets/global_textfield.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
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
            SizedBox(height: 24.h,),
            GlobalButton(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: "Saqlash",
              onTap: () {},
              color: AppColors.C_F59C16,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
