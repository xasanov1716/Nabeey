
import 'package:flutter/material.dart';
class TextWidgets extends StatelessWidget {
  const TextWidgets({super.key, required this.text, required this.fontSize});
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleLarge,
    );
  }
}
