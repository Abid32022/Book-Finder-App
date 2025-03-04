import 'package:dio/dio.dart';

import '../config/app_constant.dart';
import 'helper/custom_logger.dart';

class NetworkHandler {
  static void handleDioError(DioException error) {
    String message = '';

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout. Please try again later.";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout. Please try again later.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout. Please try again later.";
        break;
      case DioExceptionType.cancel:
        message = "Request to the server was cancelled.";
        break;
      case DioExceptionType.connectionError:
        message = "Unexpected error occurred: ${error.message}";
        break;
      case DioExceptionType.badResponse:
        if (error.response != null) {
          Map<String, dynamic> map = error.response!.data;
          message = map['message'] ?? "An unexpected error occurred. Please try again.";
        } else {
          message = "An unexpected error occurred. Please try again.";
        }
        break;
      default:
        message = "An unexpected error occurred. Please try again.";
        break;
    }

    AppLogger.error("DioError handled: $message", error, error.stackTrace);
    AppConstants.flutterToast(message: message);
    print("DioError in network error handler class =====> ${error.message}");
  }
}