import 'package:provider/provider.dart';
import '../views/book_screens/books_provider/search_provider.dart';
import '../views/theme/theme_provider.dart';

class AppAllProviders{

  static get appAllProviders => [
    ChangeNotifierProvider(create: (context) => ThemeChangerProvider()),
    ChangeNotifierProvider(create: (context) => BookProvider()),

  ];
}
