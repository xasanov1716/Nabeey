import 'package:contest_app/data/local/storage_repository/storage_repository.dart';
import 'package:contest_app/ui/widgets/global_button.dart';
import 'package:contest_app/ui/widgets/global_textfield.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../blocs/login_bloc/login_bloc.dart';
import '../../app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


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
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginStateLoading) {
            showLoadingDialog(context, "Loading...");
          }
          if (state is LoginStateError) {
            Navigator.of(context).pop();
            showErrorDialog(context, state.errorMessage);
          }
          if (state is LoginStateSuccess) {
            Navigator.of(context).pop();
            StorageRepository.putString('token', state.token);
            print(StorageRepository.getString('token'));
            Navigator.pushNamedAndRemoveUntil(
                context, RouteNames.tabBox, (route) => false);
          }
        },
        child: LayoutBuilder(builder: (context, constraints) {
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
                        "Accountga kirish",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.C_111111),
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
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
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RouteNames.auth);
                            },
                            child: Text(
                              "Account yaratish",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GlobalButton(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        title: "Login",
                        onTap: () {
                          context.read<LoginBloc>().add(LoginUser(
                              phone: convertPhoneNumber(phoneController.text),
                              password: passwordController.text));
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
      ),
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
}

String convertPhoneNumber(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'[^\d]'), '');

  if (digitsOnly.length >= 2) {
    digitsOnly = digitsOnly.substring(3);
  }

  return digitsOnly;
}


var t = {
  "statusCode": 200,
  "message": "Success",
  "data": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJQaG9uZSI6Ijk5MTIzNDU2OCIsIklkIjoiMzAiLCJyb2xlIjoiVXNlciIsIm5iZiI6MTY5NjMzNzUyMCwiZXhwIjoxNjk2MzQxMTIwLCJpYXQiOjE2OTYzMzc1MjB9.X8HF_g8o5Ts8q4BnvoJA5XFwtp5VijbgpR0jwyRjkTQ",
};
