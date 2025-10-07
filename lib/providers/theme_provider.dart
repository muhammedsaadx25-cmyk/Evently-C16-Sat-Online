import 'package:evently_online_sat/config/theme/theme_manager.dart';
import 'package:evently_online_sat/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme =  PrefsManager.getSavedTheme() ?? ThemeMode.light;

  bool get isDark => currentTheme == ThemeMode.dark;

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    PrefsManager.saveTheme(currentTheme);
    notifyListeners();
  }
}
