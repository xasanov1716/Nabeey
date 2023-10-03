import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({super.key, required this.hintText,required this.maxLines, required this.controller});

  final String hintText;
  final int? maxLines;
 final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: maxLines==1?TextInputAction.done:TextInputAction.newline,
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize:  18,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color(0x33000000),
            width: 1,
          ),
        ),
      ),
    );
  }
}
