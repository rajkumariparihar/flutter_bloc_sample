import 'package:dio/dio.dart';
import 'package:flutter_bloc_demo/utils/status_objects.dart';

Failure handleFailure(DioError e) {
  if (e.response?.statusCode != null) {
    int? responseCode = e.response?.statusCode;
    if (responseCode == 400) {
      try {
        return Failure("Failed to process request");
      } on TypeError {
        return Failure("Failed to process request");
      } on NoSuchMethodError {
        return Failure("Failed to process request");
      } on FormatException {
        return Failure("Failed to process request");
      }
    } else if (responseCode == 401) {
      // return null;
      return Failure("Token expired, refreshing token...");
    } else if (responseCode == 404) {
      return Failure('No data available');
    } else if (isBetween(responseCode ?? 0, 402, 499)) {
      return Failure("Request fields are missing.");
    } else if (isBetween(responseCode ?? 0, 500, 599)) {
      return Failure("Something went wrong, please contact Scrips support.");
    } else {
      return Failure(e.message);
    }
  } else {
    return Failure('Something went wrong, please contact Scrips support.');
  }
}

bool isBetween(int x, int lower, int upper) {
  return lower <= x && x <= upper;
}
