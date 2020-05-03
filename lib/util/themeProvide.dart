import 'package:flutter/material.dart';

class ThemeProvide with ChangeNotifier {
  int _themeIndex;
  int _languageIndex;

  int get theme => _themeIndex;
  int get language => _languageIndex;
  ThemeProvide();

  void setTheme(int index) async {
    _themeIndex = index;
    notifyListeners();
  }

  void setLanguage(int index) async {
    _languageIndex = index;
    notifyListeners();
  }
}
