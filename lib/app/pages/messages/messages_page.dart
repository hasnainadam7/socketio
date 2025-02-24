import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scoketio/app/data/controllers/chat_repo_controller.dart';
import 'package:scoketio/app/pages/messages/list_messages.dart';
import 'package:scoketio/app/widgets/custom_app_bar.dart';
import 'package:scoketio/app/widgets/custom_text_field.dart';
import '../../widgets/scaffold_body.dart';

class MessagesPage extends StatefulWidget {
  final String groupId;

  const MessagesPage({super.key, required this.groupId});

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  final TextEditingController messagesController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), // Smooth Scroll
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();

    // Listener for when keyboard opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Body(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListMessages(
                  grpID: widget.groupId,
                  scrollController: _scrollController,
                ),
              ),
              // Detect keyboard open & resize UI
              LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: CustomTextField(
                      postfixIcon: Icons.send,
                      onPostfixIconPressed: () async {

                        Get.find<ChatRepoController>().sendMessages(
                            widget.groupId, messagesController.text.trim());
                        messagesController.clear();
                        // Ensure smooth scroll after UI updates
                        Future.delayed(const Duration(milliseconds: 200), () {
                          _scrollToBottom();
                        });
                      },
                      textEditingController: messagesController,
                      hintText: "Type Your Message here",
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
