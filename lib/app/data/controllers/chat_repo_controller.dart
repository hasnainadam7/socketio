import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:scoketio/app/data/models/group_model.dart';
import 'package:scoketio/app/data/models/response_model.dart';
import 'package:scoketio/app/data/models/users_models.dart';
import 'package:scoketio/app/data/repositories/chat_repo.dart';
import 'package:scoketio/app/utils/configs.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'auth_repo_controller.dart';

class ChatRepoController extends GetxController implements GetxService {
  ChatRepo chatRepo;
  ChatRepoController({required this.chatRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final List<Group> _chatGroups = [];
  List<Group> get chatGroups => _chatGroups;

  List<Message> getMessages(String grpId) {
    Group? group = _chatGroups.firstWhereOrNull((g) => g.id == grpId);
    return group?.listOfMessages.reversed.toList() ?? [];
  }

  late io.Socket _socket;

  @override
  void onClose() {
    disconnectSocket();

    super.onClose();
  }

  void initializeSocket() {
    try {
      _socket = io.io(
          'http://192.168.100.116:3000',
          io.OptionBuilder()
              .setTransports(['websocket']) // Transport WebSocket
              .disableAutoConnect() // Manual connect
              .build());

      _socket.connect();

      _socket.off("message");
      _socket.on(
        "message",
        (data) {
          handleMessage(data);
        },
      );

      _socket.onConnect((_) {
        joinSocket();
      });

      _socket.onConnectError((error) {
        if (kDebugMode) {
          print('Socket connection error: $error');
        }
      });

      _socket.onDisconnect((disconnectError) {
        if (kDebugMode) {
          print('Socket disconnected $disconnectError');
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('Socket initialization error: $e');
      }
    }
  }

  void disconnectSocket() {
    if (_socket.connected) {
      _socket.disconnect();
      _socket.destroy();
    }
  }

  void handleMessage(Map<String, dynamic> data) {
    String groupId = data['groupId'] ?? "";
    String userId = data['userId'] ?? "";
    String content = data['content'] ?? "";
    DateTime date = DateTime.parse(data['timestamp'] ?? DateTime.now());

    Group? targetGroup =
        _chatGroups.firstWhereOrNull((group) => group.id == groupId);

    if (targetGroup != null) {
      Message newMessage = Message(
        sender: userId,
        message: content,
        imageUrl: [],
        videoUrl: [],
        date: date,
        isEdited: false,
        isDeletedToAll: false,
        isDeletedOnlyMe: false,
      );

      // Message list update karo
      targetGroup.listOfMessages.insert(0, newMessage);
      // _messages.add(newMessage);
      update();
    } else {}
  }

  void joinSocket() {
    _socket.emit("JOIN_SOCKET_EVENT",
        {"userId": Get.find<AuthRepoController>().userModel.id ?? ""});
  }

  Future<ResponseModel> loadChat(String groupId) async {
    _isLoading = true;

    late ResponseModel resModel;
    Group? targetGroup =
        _chatGroups.firstWhereOrNull((group) => group.id == groupId);
    if (targetGroup != null) {
      if (targetGroup.listOfMessages.length >= 30) {
        resModel = ResponseModel(true, "Messages already fetched ");
      } else {
        try {
          final token = Get.find<AuthRepoController>().userModel.accessToken;
          if (token == null || token.isEmpty) {
            resModel = ResponseModel(false, "Missing authentication token");
          }

          Response res = await chatRepo.loadChat(token ?? "", groupId);

          if (res.statusCode == 200 && res.body["success"]) {
            var chatData = res.body["data"];
            _chatGroups
                .firstWhereOrNull((group) => group.id == groupId)
                ?.listOfMessages
                .clear();
            if (chatData["messages"] is List) {
              printApiResponse(res.body["data"]);
              List<dynamic> messagesList = chatData["messages"];
              for (var message in messagesList) {
                _chatGroups
                    .firstWhereOrNull((group) => group.id == groupId)
                    ?.listOfMessages
                    .add(Message.fromMap(message));
                // _messages.add(Message.fromMap(message));
              }
            }
            printApiResponse(_chatGroups
                .firstWhereOrNull((group) => group.id == groupId)
                ?.listOfMessages);

            resModel = ResponseModel(true, res.body["message"]);
          } else {
            resModel = ResponseModel(
                false, res.body["message"] ?? "Failed to load chat");
          }
        } catch (e) {
          resModel = ResponseModel(false, "Error loading chat: $e");
        }
      }
    } else {
      resModel = ResponseModel(false, "Error loading chat: No grp Found");
    }
    _isLoading = false;
    update();
    return resModel;
  }

  Future<ResponseModel> loadAllGroups() async {
    update();

    String accessToken =
        Get.find<AuthRepoController>().userModel.accessToken ?? "";

    Response res = await chatRepo.loadAllGroups(accessToken);

    if (res.statusCode == 200 && res.body["success"]) {
      var chatData = res.body["data"];

      _chatGroups.clear();

      if (chatData["groupChats"] is List) {
        List<dynamic> groupsList = chatData["groupChats"];
        for (var group in groupsList) {
          printApiResponse(group);
          _chatGroups.add(Group.fromMap(group, group['_id']));
        }
      }
    }

    ResponseModel responseModel =
        ResponseModel(res.body["success"], res.body["message"]);

    update();
    return responseModel;
  }

  Future<ResponseModel> sendMessages(
      String groupId, String messageContent) async {
    update();

    UsersModel user = Get.find<AuthRepoController>().userModel;
    String accessToken = user.accessToken ?? "";
    if (accessToken.isEmpty) {
      update();
      return ResponseModel(false, "Access token is missing");
    }

    // Create the message object

    var requestData = {
      'groupId': groupId,
      'user': {'_id': user.id},
      'message': messageContent,
    };

    try {
      Response res = await chatRepo.sendMessage(requestData, accessToken);

      if (res.statusCode == 200 && res.body["success"]) {
        // var group = _chatGroups.firstWhere((group) => group.id == groupId);
        // group.listOfMessages.add(newMessage);

        // Emit message through existing socket connection if connected
        if (_socket.connected) {
          _socket.emit('send_message', {
            'groupId': groupId,
            'userId': user.id,
            'content': messageContent,
            'timestamp': DateTime.now().toIso8601String(),
          });
        } else {
          if (kDebugMode) {
            print('Socket not connected. Attempting to reconnect...');
          }
          initializeSocket();
        }

        update();
        return ResponseModel(true, "Message sent successfully");
      } else {
        update();
        return ResponseModel(false, res.body["message"]);
      }
    } catch (error) {
      update();
      return ResponseModel(false, "Failed to send message: $error");
    }
  }
}
