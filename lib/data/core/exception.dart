import 'package:dio/dio.dart';

class DioException implements Exception {
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.other:
        message = "Connection failed due to internet connection";
        break;
      case DioErrorType.response:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String _handleError(int statuscode, dynamic error) {
    switch (statuscode) {
      case 400:
        return error["message"] ?? error["success"];
      case 401:
        return error["message"];
      case 404:
        return error["message"] ?? "Not found";
      case 422:
        return error["message"] ?? "Something went wrong";
      case 500:
        return "Internal server error";
      default:
        return "Something went wrong";
    }
  }
}
