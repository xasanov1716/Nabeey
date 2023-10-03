import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({super.key, required this.onTap});

  final VoidCallback onTap;

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
        const Spacer(),
      ],
    );
  }
}
