import 'package:contest_app/utils/icons.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../app_routes.dart';

class NotRegistered extends StatelessWidget {
  const NotRegistered({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Currently you do not have an account!"),
            Image.asset(AppIcons.logo),
            Text("You can create your account here!"),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.C_F59C16,
              ),
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.login);

              }, child: Text("Create an account",style: TextStyle(color: AppColors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
