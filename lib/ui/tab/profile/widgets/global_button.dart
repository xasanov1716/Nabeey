import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: height * (56 / 812),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.C_F59C16,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
