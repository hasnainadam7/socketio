import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final String appName = dotenv.env['APP_NAME']!;
  static final String appVersion = dotenv.env['APP_VERSION']!;
  static const String token = "accessToken";

  // API Constants
  static const String baseUrl = "http://localhost:3000/api/v1";
  static const String authLoginApi = "/user/login";
  static const String authRegistrationApi = "/user/register";
  static const String authFetchLoggedUserApi = "/user/fetch-current-user";
  static const String authRefreshUser = "/user/refresh-token";



} // TODO Implement this library.
