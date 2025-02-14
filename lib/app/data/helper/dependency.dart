import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scoketio/app/data/controllers/chat_repo_controller.dart';
import 'package:scoketio/app/data/repositories/chat_repo.dart';

import '../../utils/constants.dart';
import '../api/client_api.dart';
import '../controllers/auth_repo_controller.dart';
import '../repositories/auth_repo.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Secure Storage
  const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  // Inject Secure Storage in GetX
  Get.put(secureStorage);

  // Registering ApiClient
  Get.put(ApiClient(appBaseUrl: Constants.baseUrl));

  // Registering repositories with Secure Storage
  Get.put(AuthRepo(apiClient: Get.find(), secureStorage: Get.find()));
  Get.put(ChatRepo(apiClient: Get.find(), secureStorage: Get.find()));

  // Registering controllers
  Get.put(AuthRepoController(authRepo: Get.find<AuthRepo>()));
  Get.put(ChatRepoController(chatRepo: Get.find<ChatRepo>()));
}
