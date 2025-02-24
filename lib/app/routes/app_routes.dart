part of 'app_pages.dart';

abstract class _Paths {
  static const onBoardingscreen = "/onBoardingscreen";
  static const signInScreen = "/signInScreen";
  static const signUpScreen = "/signUpScreen";
  static const contactListScreen = "/contactListScreen";
  static const messagesScreen = "/messagesScreen";
}

abstract class Routes {
  Routes._();
  static const onBoardingscreen = _Paths.onBoardingscreen;
  static const signInScreen = _Paths.signInScreen;
  static const signUpScreen = _Paths.signUpScreen;
  static const contactListScreen = _Paths.contactListScreen;
  static const messagesScreen = _Paths.messagesScreen;
}
