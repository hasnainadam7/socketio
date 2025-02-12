import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:scoketio/app/pages/sign_in_page.dart';
import 'package:scoketio/app/pages/sign_up_page.dart';

import '../pages/contactlist/contact_page.dart';
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
    GetPage(
      name: _Paths.contactListScreen,
      page: () => ContactPage(),
    ),
    GetPage(
      name: _Paths.signInScreen,
      page: () => SignInPage(),
    ),
    GetPage(
      name: _Paths.signUpScreen,
      page: () => SignUpPage(),
    ),
  ];
}
