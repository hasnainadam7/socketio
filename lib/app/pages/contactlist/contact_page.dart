import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_search_field.dart';
import '../../widgets/scaffold_body.dart';
import '../../widgets/texts/poppins.dart';
import 'contact_list.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Body(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Poppins(
                    label: "Contacts",
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                  Icon(
                    CupertinoIcons.plus,
                    weight: 50,
                  )
                ],
              ),
              const SizedBox(height: 40),
              CustomSearchField(
                searchController: searchController,
                filterSearch: (String a) {},
              ),
              const SizedBox(height: 10),
              const Expanded(child: UserListView()),
            ],
          ),
        ),
      ),
    );
  }
}
