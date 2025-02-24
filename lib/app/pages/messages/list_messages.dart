
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoketio/app/data/controllers/chat_repo_controller.dart';
import '../../data/models/group_model.dart';

class ListMessages extends StatelessWidget {
  final String grpID;
  final ScrollController scrollController; // Receive ScrollController

  const ListMessages({
    super.key,
    required this.grpID,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatRepoController>(
      initState: (_) => Get.find<ChatRepoController>().loadChat(grpID),
      builder: (chatRepoController) {
        // Auto-scroll to the latest message after UI update
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300), // Smooth Scroll
              curve: Curves.easeOut, // Natural animation
            );
          }
        });

        return Expanded(
          child: !chatRepoController.isLoading
              ? ListView.builder(
            controller: scrollController, // Attach Controller
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: chatRepoController.getMessages(grpID).length,
            itemBuilder: (context, index) {
              Message? message = chatRepoController.getMessages(grpID)[index];

              return ListTile(
                title: Text(message.message),
                subtitle: Text("Sent by: ${message.sender}"),
                trailing: Text("${message.date.toLocal()}"),
              );
            },
          )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

