import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoketio/app/widgets/texts/poppins.dart';

import '../utils/colors.dart';

class CustomCircularButton extends StatelessWidget {
  final bool isPrimaryColor;
  final bool isBorder;
  final String btnLabel;
  final double corners;
  final String? socialAuthIcon;
  final VoidCallback callbackAction;
  final Color? borderColor;
  final double elevation;
  final double labelSize;

  final FontWeight labelWeight;
  const CustomCircularButton({
    required this.callbackAction,
    required this.btnLabel,
    this.isPrimaryColor = false,
    this.isBorder = false,
    this.socialAuthIcon,
    super.key,
    this.borderColor,
    this.corners = 99,
    this.elevation = 0,  this.labelSize=20,this.labelWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.width; /**/
    return GestureDetector(
      onTap: callbackAction,
      child: SizedBox(
        width: screenWidth,
        height: 58,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: elevation > 0
                ? [
                    BoxShadow(
                      color: AppColors.primaryColor,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, elevation),
                    ),
                    BoxShadow(
                      color: AppColors.primaryColor,
                      offset: Offset(-elevation, 0),
                    )
                  ]
                : null, // Agar elevation 0 ho to shadow na lage

            border: Border.all(
                color: isBorder
                    ? borderColor ?? Colors.black
                    : elevation > 0
                        ? AppColors.primaryColor
                        : AppColors.whiteColor),
            color:
                isPrimaryColor ? AppColors.primaryColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(corners),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (socialAuthIcon != null) ...[
                Image.asset(
                  socialAuthIcon ?? "",
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 8),
              ],
              Poppins(
                weight:labelWeight,
                label: btnLabel,
                size: labelSize,
                color: !isPrimaryColor
                    ? AppColors.blackColor
                    : AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
