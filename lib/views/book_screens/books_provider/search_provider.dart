import 'package:flutter/foundation.dart';
import '../../../data/repositories/api_service.dart';
import '../book_model/search_model.dart';

class BookProvider extends ChangeNotifier {
  bool isLoading = false;
  BookModel? bookModel;
  ApiService apiService = ApiService();


  Future<void> getBookData() async {
    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    try {
      final response = await apiService.getbooks();

      if (kDebugMode) {
        print('Raw API Response: ${response.data}');
      }

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        try {
          bookModel = BookModel.fromJson(response.data as Map<String, dynamic>);
          if (kDebugMode) {
            print('Parsed Books Data: ${bookModel?.items?.length}');
          }
        } catch (e) {
          print('Error parsing data: $e');
        }
      } else {
        print('Failed to load data: Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


}
