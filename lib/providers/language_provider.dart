import 'package:evently_online_sat/core/prefs_manager/prefs_manager.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  String currentLanguage = PrefsManager.getSavedLanguage() ?? "en";

  void changeAppLanguage(String newLang){
    if(currentLanguage == newLang) return;
    currentLanguage = newLang;
    PrefsManager.saveLanguage(currentLanguage);
    notifyListeners();
  }
  bool get isEnglish=> currentLanguage == "en";
}