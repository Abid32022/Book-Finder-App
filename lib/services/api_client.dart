import 'package:dio/dio.dart';
import 'package:my_qurbani/utils/network_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/app_constant.dart';
import '../config/app_urls.dart';
import '../utils/helper/custom_logger.dart';

class APIClient {
  late final prefs = SharedPreferences.getInstance();
  Dio _dio = Dio();
  Map<String, dynamic> headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${AppConstants.getToken}'
  };

  APIClient() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: const Duration(seconds: 40),
      connectTimeout: const Duration(seconds: 40),
      baseUrl: AppUrls.baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);

    // Use Dio's built-in logging for API requests
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  // Logger instance

  Future<Response> get({
    required String url,
  }) async {
    Response response;
    try {
      AppLogger.info("GET Request to: $url");
      response = await _dio.get(
        url,
        options: Options(responseType: ResponseType.json, headers: headers),
      );
      AppLogger.debug("Response [${response.statusCode}]: ${response.data}");
    } on DioException catch (exception) {
      AppLogger.error("GET Request failed", exception, exception.stackTrace);
      NetworkHandler.handleDioError(exception);
      rethrow;
    }
    return response;
  }

  Future<Response> post({required String url, var params}) async {
    Response response;
    try {
      AppLogger.info("POST Request to: $url with params: $params");
      response = await _dio.post(
        url,
        data: params,
        options: Options(responseType: ResponseType.json, headers: headers),
      );
      AppLogger.debug("Response [${response.statusCode}]: ${response.data}");
    } on DioException catch (exception) {
      AppLogger.error("POST Request failed", exception, exception.stackTrace);
      NetworkHandler.handleDioError(exception);
      rethrow;
    }
    return response;
  }

  Future<Response> delete({required String url, var params}) async {
    Response response;
    try {
      AppLogger.info("DELETE Request to: $url with params: $params");
      response = await _dio.delete(
        url,
        data: params,
        options: Options(responseType: ResponseType.json, headers: headers),
      );
      AppLogger.debug("Response [${response.statusCode}]: ${response.data}");
    } on DioException catch (exception) {
      AppLogger.error("DELETE Request failed", exception, exception.stackTrace);
      NetworkHandler.handleDioError(exception);
      rethrow;
    }
    return response;
  }

  Future<Response> put({required String url, var params}) async {
    Response response;
    try {
      AppLogger.info("PUT Request to: $url with params: $params");
      response = await _dio.put(
        url,
        data: params,
        options: Options(responseType: ResponseType.json, headers: headers),
      );
      AppLogger.debug("Response [${response.statusCode}]: ${response.data}");
    } on DioException catch (exception) {
      AppLogger.error("PUT Request failed", exception, exception.stackTrace);
      NetworkHandler.handleDioError(exception);
      rethrow;
    }
    return response;
  }
}
