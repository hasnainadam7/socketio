import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import '../../utils/constants.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;

  //Server Url
  final String appBaseUrl;
  late Map<String, String> _header;


  //ye line kis kaam ki hai r dussra


  String basicAuth = 'Basic ${base64Encode(utf8.encode('admin:admin'))}';

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = Constants.token;
    _header = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  void updateToken(String newToken) {
    token = newToken;

    _header = {
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
  }

  Future<Response> getData(String uri) async {
    Response response = await get(uri, headers: _header);
    if (response.statusCode == 200) {
      return response;
    } else {
      return const Response(statusCode: 1, statusText: "HTTP error");
    }
  }

  Future<Response> postData(String uri, dynamic body) async {

    Response response = await post(uri, body, headers: _header);


    return response;
  }
}
