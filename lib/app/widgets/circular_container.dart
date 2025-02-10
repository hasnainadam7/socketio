import 'package:flutter/cupertino.dart';
import 'package:scoketio/app/utils/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
    this.corners = 10,
    this.color = AppColors.whiteColor,
    required this.child,
    this.padding = const EdgeInsets.all(0),
  });
  final EdgeInsets padding;
  final double corners;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(corners),
      ),
      child: child,
    );
  }
}
