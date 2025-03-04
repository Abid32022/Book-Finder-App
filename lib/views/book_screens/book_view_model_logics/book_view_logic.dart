import 'package:flutter/material.dart';
import '../../../services/database_helper.dart';
import '../book_model/search_model.dart';
import '../books_provider/search_provider.dart';

class BooksViewModel extends ChangeNotifier {

  final BookProvider _bookProvider;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Items> _allBooks = [];
  List<Items> _foundBooks = [];
  Map<String, bool> _favoriteStatus = {};
  bool _isLoading = false;

  BooksViewModel(this._bookProvider) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchBooks();
    });
  }

  List<Items> get allBooks => _allBooks;
  List<Items> get foundBooks => _foundBooks;
  bool get isLoading => _isLoading;
  Map<String, bool> get favoriteStatus => _favoriteStatus;

  Future<void> fetchBooks() async {
    _isLoading = true;
    notifyListeners();

    await _bookProvider.getBookData();
    _allBooks = _bookProvider.bookModel?.items ?? [];
    _foundBooks = _allBooks;
    await _loadFavorites();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    for (var book in _allBooks) {
      bool isFavorite = await _dbHelper.isFavorite(book.id!);
      _favoriteStatus[book.id!] = isFavorite;
    }
    notifyListeners();
  }

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      _foundBooks = _allBooks;
    } else {
      _foundBooks = _allBooks.where((book) {
        final title = book.volumeInfo?.title?.toLowerCase() ?? '';
        return title.contains(enteredKeyword.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  Future<void> toggleFavorite(Items book) async {
    final isFavorite = _favoriteStatus[book.id!] ?? false;
    if (isFavorite) {
      await _dbHelper.removeFromFavorites(book.id!);
    } else {
      await _dbHelper.addToFavorites({

        'id': book.id,
        'title': book.volumeInfo?.title ?? 'No Title',
        'authors': book.volumeInfo?.authors?.join(', ') ?? 'Unknown',
        'thumbnail': book.volumeInfo?.imageLinks?.thumbnail ?? '',

      });
    }
    _favoriteStatus[book.id!] = !isFavorite;
    notifyListeners();
  }
}
