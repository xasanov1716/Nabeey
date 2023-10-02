import 'dart:io';

import 'package:contest_app/ui/widgets/global_button.dart';
import 'package:contest_app/ui/widgets/global_textfield.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../blocs/login_bloc/login_bloc.dart';
import '../../../../utils/icons.dart';
import '../../../widgets/open_camera_gallery_dialog.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  String? selectedImagePath;

  @override
  void initState() {
    super.initState();
    selectedImagePath != null;
  }


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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    GlobalTextField(
                      controller: nameController,
                        hintText: "Username",
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        caption: "Ism"),
                    GlobalTextField(
                      controller: lastnameController,
                        hintText: "Lastname",
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        caption: "Familya"),
                    GlobalTextField(
                        controller: phoneController,
                        hintText: "+(998) 91 234-56-78",
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        caption: "Tel raqam"),
                    GlobalTextField(
                        controller: passwordController,
                        hintText: "********",
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        caption: "Parol"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: AppColors.C_F59C16),
                          child: ZoomTapAnimation(
                            onTap: () {
                              showCameraAndGalleryDialog(context, (imagePath) {
                                if (imagePath != null) {
                                  setState(() {
                                    selectedImagePath = imagePath;
                                  });
                                }
                              });
                            },
                            child: SvgPicture.asset(AppIcons.camera),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    selectedImagePath != null
                        ? Container(
                      height: 270.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20
                        ),
                        child: Image.file(
                          File(selectedImagePath!),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        :
                    SizedBox(),
                    SizedBox(
                      height: 20.h,
                    ),
                    GlobalButton(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      title: "Ro'yxatdan o'tish",
                      onTap: () {
                        context.read<LoginBloc>().add(LoginUser(phone: convertPhoneNumber(phoneController.text), password: passwordController.text));
                      },
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




void showLoadingDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20.0),
              Text(message),
            ],
          ),
        ),
      );
    },
  );
}

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}String convertPhoneNumber(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'[^\d]'), '');

  String result = "%2B$digitsOnly";

  return result;
}