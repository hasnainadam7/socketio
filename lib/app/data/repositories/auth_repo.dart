import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../../utils/constants.dart';
import '../api/client_api.dart';
import '../models/users_models.dart';

class AuthRepo {
  final ApiClient apiClient;
  final FlutterSecureStorage secureStorage; // Secure storage instance

  AuthRepo({required this.apiClient, required this.secureStorage});

  Future<Response> registration(UsersModel body) async {
    return await apiClient.postData(
      Constants.authRegistrationApi,
      body.toMap(),
    );
  }

  //done
  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        Constants.authLoginApi, {"Email": email, "Password": password});
  }

  void signOut() async {
    await secureStorage.delete(key: Constants.token);
    apiClient.token = "";
    apiClient.updateToken("");
  }

  //done but waiting for check on registration
  Future<bool> saveToken(String token) async {
    try {
      apiClient.token = token;
      apiClient.updateToken(token);
      await secureStorage.write(key: Constants.token, value: token);
      return true;
    } catch (e) {
      return false;
    }
  }

  //done
  // Future<bool> isUserLoggedIn() async {
  //   String? token = await secureStorage.read(key: Constants.token);
  //   return token != null;
  // }

  //done
  Future<Response> getUser(String token) async {
    Response res = await apiClient
        .postData(Constants.authFetchLoggedUserApi, {"refreshToken": token});


    return res;
  }

  Future<String> getToken() async {
    return await secureStorage.read(key: Constants.token) ?? "";
  }

  //done
  Future<Response> refreshTokens() async {
    String token = await getToken();
    if (token.isEmpty) {
      return const Response(
          statusCode: 400, statusText: "Unauthorized Request");
    }
    Response res = await apiClient
        .postData(Constants.authRefreshUser, {"refreshToken": token});

    return res;
  }
}
