import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      this.obscureText = false});
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      obscureText: _obscureText,
      cursorColor: AppColors.primaryColor,
      cursorErrorColor: AppColors.errorColor,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  color: const Color(0xff75788D),
                  size: 24,
                  _obscureText
                      ? Icons.visibility
                      : Icons.visibility_off, // Visibility icons
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText; // Toggle visibility
                  });
                },
              )
            : null,
        hintStyle: const TextStyle(
          letterSpacing: 0.5,
          color: AppColors.inputTextFieldHINTColor,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          fontFamily: "Poppins",
        ),
        filled: true,
        fillColor: AppColors.inputTextFieldBGColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14.0,
          horizontal: 16.0,
        ),
        border: kOutlineInputBorder(null),
        focusedBorder:
            kOutlineInputBorder(AppColors.primaryColor.withOpacity(0.5)),
        errorBorder: kOutlineInputBorder(AppColors.errorColor),
      ),
    );
  }
}
