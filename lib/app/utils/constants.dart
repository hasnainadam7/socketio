import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants{
   static final String appName = dotenv.env['APP_NAME']!;
   static final String appVersion= dotenv.env['APP_VERSION']!;
   static const String token ="";
   // API Constants
   static final String baseUrl = dotenv.env['BASE_URL'] ?? "https:localhost:3000/";
   static final String apiVersion = dotenv.env['API_VERSION'] ?? "api/v1";

}// TODO Implement this library.