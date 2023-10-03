import 'package:contest_app/utils/colors.dart';
import 'package:flutter/material.dart';

class GlobalButton extends StatefulWidget {
  const GlobalButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.C_F59C16,
      ),
      child: TextButton(
        onPressed: widget.onTap,
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
