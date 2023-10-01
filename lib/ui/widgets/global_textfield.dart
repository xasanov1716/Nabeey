// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../utils/colors.dart';

class GlobalTextField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData? prefixIcon;
  final String caption;
  final TextEditingController? controller;
  final ValueChanged? onChanged;
  final String? Function(String?)? validator;

  const GlobalTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.textInputAction,
    this.prefixIcon,
    required this.caption,
    this.controller, this.onChanged, this.validator,
  }) : super(key: key);

  @override
  _GlobalTextFieldState createState() => _GlobalTextFieldState();
}

class _GlobalTextFieldState extends State<GlobalTextField> {
  bool _isPasswordVisible = false;
  late MaskTextInputFormatter _phoneMaskFormatter;

  @override
  void initState() {
    super.initState();
    _phoneMaskFormatter = MaskTextInputFormatter(
      mask: '+(998) ## ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.caption.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                widget.caption,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
            onTapOutside: (event){
              FocusManager.instance.primaryFocus?.unfocus();
            },
            cursorColor: AppColors.C_111111,
            cursorHeight: 25,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                widget.prefixIcon,
                color: Colors.grey,
              )
                  : null,
              suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                  ? IconButton(
                splashRadius: 1,
                icon: Icon(
                  _isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.C_111111, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              // filled: true,
              // fillColor: Colors.black12,
            ),
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            inputFormatters: widget.keyboardType == TextInputType.phone
                ? [_phoneMaskFormatter]
                : null,
            obscureText: widget.keyboardType == TextInputType.visiblePassword
                ? !_isPasswordVisible
                : false,
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
