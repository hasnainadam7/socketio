import 'package:flutter/material.dart';

class ReUsableText extends StatelessWidget {
  final String label;
  final TextAlign? align;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final String fontFamily;
  final int maxLines;

  const ReUsableText({
    super.key,
    required this.label,
    this.align = TextAlign.center,
    this.color = const Color(0xff1e1e1e),
    this.weight = FontWeight.w400,
    this.size = 16.0,
    required this.fontFamily,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      label,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        fontFamily: fontFamily,
      ),
    );
  }
}