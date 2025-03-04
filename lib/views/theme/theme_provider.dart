import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeChangerProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ThemeChangerProvider() {
    _loadThemeFromPreferences(); // Load theme on initialization
  }
  void setTheme(ThemeMode? themeMode)async {
    if (themeMode != null) { // Handle the nullable case
      _themeMode = themeMode;
      notifyListeners();
      await _saveThemeToPreferences(themeMode);
    }
  }

  Future<void> _saveThemeToPreferences(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', themeMode.toString());
  }

  Future<void> _loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('themeMode');

    if (savedTheme != null) {
      _themeMode = ThemeMode.values.firstWhere(
            (e) => e.toString() == savedTheme,
        orElse: () => ThemeMode.light,
      );
      notifyListeners();
    }
  }
}
