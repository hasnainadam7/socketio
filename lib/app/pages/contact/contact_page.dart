import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoketio/app/data/controllers/auth_repo_controller.dart';

import 'package:scoketio/app/data/controllers/chat_repo_controller.dart';
import 'package:scoketio/app/pages/sign_in_page.dart';

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
    return GetBuilder<ChatRepoController>(
        initState: (_) => Get.find<ChatRepoController>().initializeSocket(),
        builder: (chatRepo) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: SafeArea(
              child: Body(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Poppins(
                          label: "Contacts",
                          size: 20,
                          weight: FontWeight.w500,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.logout,
                            weight: 50,
                          ),
                          onPressed: () async {
                            Get.find<ChatRepoController>().disconnectSocket();
                            await Get.find<AuthRepoController>().removeToken();
                            Get.off(() => SignInPage());
                          },
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
        });
  }
}
