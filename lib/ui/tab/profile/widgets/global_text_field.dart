import 'package:flutter/material.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({super.key, required this.hintText,required this.maxLines});

  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
