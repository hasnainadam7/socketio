import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';
import '../api/client_api.dart';

Future<void> init() async {
  // Obtain shared preferences.
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  Get.lazyPut(() => prefs);
  // Registering ApiClient
  Get.lazyPut(
    () => ApiClient(appBaseUrl: Constants.baseUrl),
  );
  //
  // Registering repositories
  // Get.lazyPut(
  //         () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  //
  // Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  // Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  // Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  // Get.lazyPut(
  //         () => LocationRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => PaymentRepo());
  //
  // // Registering controllers
  // Get.lazyPut(() => AuthRepoController(authRepo: Get.find()));
  // Get.lazyPut(() => ProductRepoController(
  //     popularProductRepo: Get.find(), recommendedProductRepo: Get.find()));
  // Get.lazyPut(() => CartRepoController(cartRepo: Get.find()));
  // Get.lazyPut(() =>
  //     UserRepoController(userRepo: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => LocationRepoController(locationRepo: Get.find()));
  // Get.lazyPut(() => PaymentRepoController(paymentRepo: Get.find()));
}
