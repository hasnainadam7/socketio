// import 'package:flutter/material.dart';
//
// import '../utils/colors.dart';
// import 'styles.dart';
//
// class CustomTextField extends StatefulWidget {
//   const CustomTextField({
//     super.key,
//     required this.textEditingController,
//     required this.hintText,
//     this.obscureText = false,
//     this.postfixIcon,
//     this.onPostfixIconPressed,
//   });
//
//   final TextEditingController textEditingController;
//   final String hintText;
//   final bool obscureText;
//   final IconData? postfixIcon;
//   final VoidCallback? onPostfixIconPressed;
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   bool _obscureText = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _obscureText = widget.obscureText;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: widget.textEditingController,
//       obscureText: _obscureText,
//       cursorColor: AppColors.primaryColor,
//       cursorErrorColor: AppColors.errorColor,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         suffixIcon: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (widget.obscureText)
//               IconButton(
//                 icon: Icon(
//                   _obscureText ? Icons.visibility : Icons.visibility_off,
//                   color: const Color(0xff75788D),
//                   size: 24,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _obscureText = !_obscureText;
//                   });
//                 },
//               ),
//             if (widget.postfixIcon != null)
//               IconButton(
//                 icon: Icon(
//                   widget.postfixIcon,
//                   color: AppColors.primaryColor,
//                   size: 24,
//                 ),
//                 onPressed: widget.onPostfixIconPressed,
//               ),
//           ],
//         ),
//         hintStyle: const TextStyle(
//           letterSpacing: 0.5,
//           color: AppColors.inputTextFieldHINTColor,
//           fontWeight: FontWeight.w400,
//           fontSize: 16,
//           fontFamily: "Poppins",
//         ),
//         filled: true,
//         fillColor: AppColors.inputTextFieldBGColor,
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 14.0,
//           horizontal: 16.0,
//         ),
//         border: kOutlineInputBorder(null),
//         focusedBorder:
//         kOutlineInputBorder(AppColors.primaryColor.withOpacity(0.5)),
//         errorBorder: kOutlineInputBorder(AppColors.errorColor),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.obscureText = false,
    this.postfixIcon,
    this.onPostfixIconPressed,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  final IconData? postfixIcon;
  final Future<void> Function()? onPostfixIconPressed; // Change to Future<void>

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  Future<void> _handlePostfixPress() async {
    if (widget.onPostfixIconPressed != null) {
      setState(() => _isLoading = true);
      await widget.onPostfixIconPressed!();
      setState(() => _isLoading = false);
    }
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
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.obscureText)
              IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xff75788D),
                  size: 24,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            if (widget.postfixIcon != null)
              Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _isLoading
                        ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primaryColor),
                      ),
                    )
                        : IconButton(
                      icon: Icon(
                        widget.postfixIcon,
                        color: AppColors.primaryColor,
                        size: 24,
                      ),
                      onPressed: _handlePostfixPress,
                    ),
                  ),
                ],
              ),
          ],
        ),
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
