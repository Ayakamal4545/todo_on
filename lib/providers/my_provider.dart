import 'package:flutter/material.dart';
import 'package:todo_on/app_color.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark; // Default theme mode

  ThemeMode get themeMode => _themeMode;

  ThemeData get themeData =>
      _themeMode == ThemeMode.dark ? darkTheme : lightTheme;

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColor.primary,
    );
  }
  ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
      scaffoldBackgroundColor:Colors.black,
  );
  }
  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}