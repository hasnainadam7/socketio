import 'dart:convert';

import 'package:flutter/foundation.dart';

void printApiResponse(dynamic responseBody) {
  if (responseBody is String) {
    try {
      responseBody = jsonDecode(responseBody);
    } catch (e) {
      if (kDebugMode) {
        print("Error decoding JSON: $e");
      }
      return;
    }
  }

  if (responseBody is Map<String, dynamic>) {
    responseBody.forEach((key, value) {
      if (kDebugMode) {
        print("$key: $value");
      }
    });
  } else if (responseBody is List) {
    for (var item in responseBody) {
      if (kDebugMode) {
        print(item);
      }
    }
  } else {
    if (kDebugMode) {
      print("Response is neither a Map nor a List: $responseBody");
    }
  }
}