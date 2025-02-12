import 'dart:convert';

import 'package:get/get.dart';
import 'package:scoketio/app/utils/configs.dart';
import '../models/response_model.dart';
import '../models/users_models.dart';
import '../repositories/auth_repo.dart';

class AuthRepoController extends GetxController implements GetxService {
  AuthRepo authRepo;
  late UsersModel _usersModels;
  UsersModel get userModel => _usersModels;

  AuthRepoController({required this.authRepo});

  Future<ResponseModel> registration(UsersModel registration) async {
    Response res = await authRepo.registration(registration);
    late ResponseModel responseModel;
    if (res.statusCode == 200) {
      saveToken(res.body["token"]);

      responseModel = ResponseModel(true, res.body["token"]);
    } else {
      responseModel = ResponseModel(false,
          res.statusText! + res.status.toString() + res.statusCode.toString());
    }
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, password) async {
    Response res = await authRepo.login(email, password);
    late ResponseModel responseModel;

    if (res.statusCode == 200) {
      await authRepo.saveToken(res.body["data"]["accessToken"]);

      _usersModels = UsersModel.fromMap(res.body["data"]["fetchedUser"]);

      responseModel = ResponseModel(true, res.statusText!);
    } else {
      responseModel = ResponseModel(false, res.bodyString!);
    }

    update();
    return responseModel;
  }

  void signOut() {
    authRepo.signOut();
    update();
  }

  Future<UsersModel> getUser(String token) async {

    Response res = await authRepo.getUser(token);
    UsersModel usersModels = UsersModel.fromMap(res.body["data"]["user"]);
    return usersModels;
  }

  Future<bool> saveToken(String token) async {
    return await authRepo.saveToken(token);
  }

  checkUserIfLogin(){
    authRepo.refreshUser();
    //checkTokenAccess
    //validate it if its expire or not
    //refresh it via

  }

}
