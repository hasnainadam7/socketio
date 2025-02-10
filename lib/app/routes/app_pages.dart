import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/onboarding_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.onBoardingscreen;

  static final routes = [
    GetPage(
      name: _Paths.onBoardingscreen,
      page: () => const onBoardingPage(),
    ),
  ];

}
