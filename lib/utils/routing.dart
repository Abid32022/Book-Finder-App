import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_qurbani/views/theme/theme_screen.dart';
import '../views/book_screens/books_screen.dart';
import '../views/book_screens/fav_book_screen/fav_book_screen.dart';
import '../views/dashboard/bottom_nav.dart';


class AppRoute{
  static final GoRouter router = GoRouter(routes:  [
    GoRoute(
      path: "/",
            pageBuilder: (context, state)=>MaterialPage(child: BottomNavScreen()),
    ),
    GoRoute(
      path: "/BottomNavScreen",
            pageBuilder: (context, state)=>MaterialPage(child: BottomNavScreen()),
    ),
    GoRoute(
      path: "/FilterSearchTextfield",
            pageBuilder: (context, state)=>MaterialPage(child: BooksScreen()),
    ),
    GoRoute(
      path: "/FavoritesScreen",
            pageBuilder: (context, state)=>MaterialPage(child: FavoritesScreen()),
    ),
    GoRoute(
      path: "/LightDarkThemeScreen",
      pageBuilder: (context, state)=>MaterialPage(child: LightDarkThemeScreen()),
    ),

  ]
);}
