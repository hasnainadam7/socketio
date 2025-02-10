import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants{
   static final String appName = dotenv.env['APP_NAME']!;
   static final String appVersion= dotenv.env['APP_VERSION']!;
   static const String token ="";
   // API Constants
   static final String baseUrl = dotenv.env['BASE_URL'] ?? "http://localhost:3000/api/v1";
   static final String apiVersion = dotenv.env['API_VERSION'] ?? "";
   static const String authLoginApi = "/login";

}// TODO Implement this library.