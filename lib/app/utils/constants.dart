import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final String appName = dotenv.env['APP_NAME']!;
  static final String appVersion = dotenv.env['APP_VERSION']!;
  static const String token = "";

  // API Constants
  static const String baseUrl = "http://192.168.100.116:3000/api/v1";

  static const String authLoginApi = "/user/login"; //tested
  static const String authRegistrationApi = "/user/register"; //not tested yet
  static const String authFetchLoggedUserApi =
      "/user/fetch-current-user"; //tested
  static const String authRefreshUser = "/user/refresh-token"; //tested
  static const String authGetUser = "/user/get-all-user";

  static const String chatGetAllGroupChats =
      "/chats/get-all-group-chats"; //post
  static const String chatCreateChat = "/chats/create-chat"; // post
  static const String chatFetchChatMessages =
      "/chats/fetch-chat-messages"; //get
  static const String chatSendChatMessages = "/chats/send-chat-messages"; //post
} // TODO Implement this library.
