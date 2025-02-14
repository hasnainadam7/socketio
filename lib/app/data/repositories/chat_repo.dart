import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../utils/constants.dart';
import '../api/client_api.dart';

class ChatRepo {
  final ApiClient apiClient;
  final FlutterSecureStorage secureStorage;
  ChatRepo({required this.apiClient, required this.secureStorage});

  Future<Response> loadAllGroups(String token) async {
    return await apiClient
        .postData(Constants.chatGetAllGroupChats, {"accessToken": token});
  }

  // Future<Response> getUser(String token) async {
  //   Response res = await apiClient
  //       .postData(Constants.authFetchLoggedUserApi, {"accessToken": token});
  //   // printApiResponse(res.body);
  //
  //   return res;
  // }
}
