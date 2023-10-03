import 'package:contest_app/ui/widgets/global_button.dart';
import 'package:contest_app/ui/widgets/global_textfield.dart';
import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../blocs/login_bloc/login_bloc.dart';
import '../../app_routes.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
          if (state is LoginStateLoading){
            showLoadingDialog(context,"Loading...");
          }
          if (state is LoginStateError){
            Navigator.of(context).pop();
            showErrorDialog(context,state.errorMessage);
          }
          if (state is LoginStateSuccess){
            Navigator.of(context).pop();
            Navigator.pushNamed(context, RouteNames.articles);
          }
        },
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Quiz da qatnashish uchun ",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.C_007BEC),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Ro’yhatdan o’ting",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.C_111111),
                      ),
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
                    GlobalButton(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      title: "Login",
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
}String convertPhoneNumber(String input) {
  String digitsOnly = input.replaceAll(RegExp(r'[^\d]'), '');

  String result = "%2B$digitsOnly";

  return result;
}