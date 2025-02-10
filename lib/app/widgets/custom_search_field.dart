import 'package:flutter/material.dart';
import 'package:scoketio/app/utils/colors.dart';

import 'styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.searchController,
    required this.filterSearch,
  });

  final TextEditingController searchController;
  final Function(String) filterSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: filterSearch,
      decoration: InputDecoration(
        focusColor: AppColors.inputTextFieldBGColor,
        hintText: "Search",
        prefixIcon: const Icon(Icons.search),
        fillColor: AppColors.inputTextFieldBGColor,
        filled: true,
        border: kOutlineInputBorder(null),
        focusedBorder: kOutlineInputBorder(null),
        errorBorder: kOutlineInputBorder(AppColors.errorColor),
      ),
    );
  }
}
