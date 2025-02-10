import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';
import '../api/client_api.dart';
import '../models/users_models.dart';

class AuthRepo {
  final ApiClient apiClient;

  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registraion(User body) async {
    // apiClient.setBasicAuth('admin', 'admin');
    return await apiClient.postData(
      Constants.authLoginApi,
      body.toJson(),
    );
  }

  Future<Response> login(String email, String password) async {
    // apiClient.setBasicAuth('admin', 'admin');
    return await apiClient.postData(
        Constants.authLoginApi, {"email": email, "password": password});
  }

  void signOut() {
    sharedPreferences.remove(Constants.token);

    apiClient.token = "";
    apiClient.updateToken("");
  }

  Future<bool> saveToken(String token) async {
    apiClient.token = token;
    apiClient.updateToken(token);
    return await sharedPreferences.setString(Constants.token, token);
  }

  Future<String> getToken() async {
    return sharedPreferences.getString(Constants.token) ?? "Null";
  }

  bool isUserLoggedIn() {
    return sharedPreferences.containsKey(Constants.token);
  }

  // Future<void> saveUserNumberNPassword(String number, String pass) async {
  //   try {
  //     await sharedPreferences.setString(Constants.PHONE, number);
  //     await sharedPreferences.setString(Constants.PASSWORD, pass);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
