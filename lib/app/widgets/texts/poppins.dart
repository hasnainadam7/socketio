import 'package:flutter/material.dart';
import 'package:scoketio/app/widgets/texts/re_useable_texts.dart';

class Poppins extends StatelessWidget {
  final String label;
  final TextAlign? align;
  final Color? color;
  final FontWeight? weight;
  final double? size;
  final int maxLines;

  const Poppins({
    required this.label,
    super.key,
    this.align,
    this.color,
    this.weight,
    this.size,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ReUsableText(
      maxLines: maxLines,
      label: label,
      fontFamily: "Poppins",
      align: align,
      color: color,
      weight: weight,
      size: size,
    );
  }
}
