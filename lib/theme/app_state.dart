import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool _isDarkMode = true;
  Locale _locale = const Locale('es', 'ES');

  bool get isDarkMode => _isDarkMode;
  Locale get locale => _locale;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setLocale(Locale newLocale) {
    _locale = newLocale;
    notifyListeners();
  }
}
