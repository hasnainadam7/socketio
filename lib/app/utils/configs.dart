import 'dart:convert';
import 'package:flutter/foundation.dart';

int counter = 0;

void printApiResponse(dynamic responseBody) {
  counter++;
  if (kDebugMode) print("Total Print No: $counter");

  if (responseBody is String) {
    try {
      responseBody = jsonDecode(responseBody);
    } catch (e) {
      if (kDebugMode) print("Error decoding JSON: $e\n");
      return;
    }
  }

  if (responseBody is Map<String, dynamic>) {
    responseBody.forEach((key, value) {
      if (kDebugMode) print("$key: $value");
    });
  } else if (responseBody is List) {
    for (var item in responseBody) {
      if (kDebugMode) print(item);
    }
  } else {
    if (kDebugMode) {
      print("Response is neither a Map nor a List: $responseBody");
    }
  }

  if (kDebugMode) print("\n");
}
