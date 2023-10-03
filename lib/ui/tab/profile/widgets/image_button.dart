import 'dart:io';

import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({super.key, required this.onTap, required this.path});

  final VoidCallback onTap;
  final String path;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(width * (20 / 812)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppColors.C_F59C16,
                width: 1,
              ),
            ),
            child: const Text('Rasm joylash'),
          ),
        ),
        SizedBox(width: 10.w),
        Visibility(
          visible: path.isEmpty ? false : true,
          child: Image.file(
            File(path),
            height: 50.w,
            width: 50.w,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
