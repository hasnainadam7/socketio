import 'package:get/get.dart';
import 'package:scoketio/app/data/controllers/chat_repo_controller.dart';
import 'package:scoketio/app/utils/configs.dart';

import '../models/response_model.dart';
import '../models/users_models.dart';
import '../repositories/auth_repo.dart';

class AuthRepoController extends GetxController implements GetxService {
  AuthRepo authRepo;
  late UsersModel _usersModels;
  UsersModel get userModel => _usersModels;

  AuthRepoController({required this.authRepo});

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadUser();
  }

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
    try {
      Response res = await authRepo.login(email, password);
      late ResponseModel responseModel;
      printApiResponse(res.body);

      if (res.statusCode == 200) {
        await authRepo.saveToken(res.body["data"]["dbRefreshToken"]);

        _usersModels = UsersModel.fromMap(res.body["data"]["fetchedUser"]);
        _usersModels.copyWith(accessToken: res.body["data"]["accessToken"]);
        await loadUser();
        responseModel = ResponseModel(res.body["success"], res.statusText!);
      } else {
        responseModel = ResponseModel(res.body["success"], res.bodyString!);
      }

      update();
      return responseModel;
    } catch (e) {
      rethrow;
    }
  }

  void signOut() {
    authRepo.signOut();
    update();
  }

  Future<void> getUser(String token) async {
    Response res = await authRepo.getUser(token);

    _usersModels = UsersModel.fromMap(res.body["data"]["user"]);
    _usersModels = _usersModels.copyWith(accessToken: token);
    update();
  }

  Future<bool> saveToken(String token) async {
    return await authRepo.saveToken(token);
  }

  Future<void> removeToken() async {
    await authRepo.removeToken();
    Get.find<ChatRepoController>().disconnectSocket();
  }

  Future<ResponseModel> loadUser() async {
    try {
      Response res = await authRepo.refreshTokens();

      late ResponseModel responseModel;

      if (res.statusCode! > 199 && res.statusCode! < 300) {
        responseModel = ResponseModel(res.body["success"], res.body["message"]);

        await authRepo.saveToken(res.body["data"]["dbRefreshToken"]);

        await getUser(res.body["data"]["accessToken"]);
      } else {
        responseModel = ResponseModel(res.body["success"], res.body["message"]);
      }

      return responseModel;
    } catch (e) {
      return ResponseModel(false, "Error : $e");
    }
  }
}
