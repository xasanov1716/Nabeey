import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double? strokeWidth;

  const CustomCircularProgressIndicator({
    super.key,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (strokeWidth == 3.0 || strokeWidth == null) {
      return CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.C_F59C16),
      );
    } else {
      return CircularProgressIndicator(
        strokeWidth: strokeWidth!,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
      );
    }
  }
}
