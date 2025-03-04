
import 'package:dio/dio.dart';
import '../../config/app_urls.dart';
import '../../services/api_client.dart';

class ApiService {
  final APIClient apiClient = APIClient();

  Future<Response> getbooks() {
    return apiClient.get(url: AppUrls.baseUrl+AppUrls.fetchBooks);
  }

}
