
import 'package:get/get.dart';

import 'package:scoketio/app/data/models/group_model.dart';
import 'package:scoketio/app/data/models/response_model.dart';
import 'package:scoketio/app/data/repositories/chat_repo.dart';

import 'auth_repo_controller.dart';

class ChatRepoController extends GetxController implements GetxService {
  ChatRepo chatRepo;
  ChatRepoController({required this.chatRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final List<Group> _chatGroups = [];
  List<Group> get chatGroups => _chatGroups;

  Future<ResponseModel> loadAllGroups() async {
    _isLoading = true;
    update(); // UI update karega

    String accessToken =
        Get.find<AuthRepoController>().userModel.accessToken ?? "";

    Response res = await chatRepo.loadAllGroups(accessToken);

    if (res.statusCode == 200 && res.body["success"]) {
      var chatData = res.body["data"];

      // Ensure data is a list
      if (chatData is List<dynamic>) {
        _chatGroups.clear();
        _chatGroups
            .addAll(chatData.map((e) => Group.fromMap(e, e['id'])).toList());
      } else {
        // Handle empty or incorrect format response
        _chatGroups.clear();
      }
    }

    ResponseModel responseModel =
        ResponseModel(res.body["success"], res.body["message"]);

    _isLoading = false;
    update(); // UI update karega
    return responseModel;
  }



}
