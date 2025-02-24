import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoketio/app/data/controllers/chat_repo_controller.dart';

import '../../utils/assets.dart';
import '../../utils/colors.dart';
import '../../widgets/circular_container.dart';
import '../../widgets/texts/poppins.dart';
import '../messages/messages_page.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatRepoController>(builder: (chatRepoController) {
      return ListView.builder(
        itemCount: chatRepoController.chatGroups.length,
        itemBuilder: (context, index) {
          final user = chatRepoController.chatGroups[index];
          const int  currentMsgIndex= 0;
          return InkWell(
            onTap: () {
              Get.to(() => MessagesPage(
                groupId: user.id,
              ));
              // Get.toNamed(Routes.messagesScreen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          CircularContainer(
                            child: Image.asset(
                              Assets.images.dp1,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Poppins(
                            label: user.groupTitle,
                            size: 18,
                          ),
                          Poppins(
                            label: user.listOfMessages.isNotEmpty
                                ? user.listOfMessages[currentMsgIndex].message
                                : "No messages yet", // Display a fallback message when there are no messages
                            size: 12,
                            color: AppColors.greyColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: AppColors.greyColor,
                    thickness: 0.5,
                  )
                ],
              ),
            ),
          );
        },
      ) ;
    });
  }
}
