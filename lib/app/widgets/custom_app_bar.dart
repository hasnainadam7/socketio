import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoketio/app/widgets/texts/poppins.dart';


import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.centerTitle = true,
    this.title = "Socket IO",
    this.backgroundColor = AppColors.whiteColor,
    this.iconColor = AppColors.blackColor,
    this.iconData = CupertinoIcons.back,
  });

  final bool centerTitle;
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        iconData,
        color: iconColor,
      ),
      title: Poppins(
        label: title,
        weight: FontWeight.w600,
        color: AppColors.primaryColor,
      ),
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
