import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en'); // Default locale

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return; // Ensure the locale is supported
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en'); // Reset to default
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'), // English
    const Locale('ar'), // Arabic
  ];
}
