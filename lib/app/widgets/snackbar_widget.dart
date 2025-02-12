import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class CustomSnackbar {
  static void showSnackbar({
    required String description,
    String title = "Error",
    bool isError = true,
    int duration = 1,
  }) {
    // Close any existing snackbars
    Get.closeAllSnackbars();

    Get.snackbar(
      title,
      description,
      backgroundColor: isError ? Colors.redAccent : AppColors.succuessColor,
      colorText: Colors.white,
      duration: Duration(seconds: duration),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
