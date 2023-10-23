import 'package:flutter/material.dart';

ThemeData originalTheme = ThemeData(
  primaryColor: Colors.brown[400],
  scaffoldBackgroundColor: const Color.fromARGB(255, 67, 47, 38),
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Color.fromARGB(255, 228, 217, 215)),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 21, 14, 12),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

ThemeData lightTheme = ThemeData(
  primaryColor: Color.fromARGB(255, 0, 102, 65),
  scaffoldBackgroundColor: Color.fromARGB(255, 96, 221, 204),
  textTheme: const TextTheme(
    bodyText2: TextStyle(color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 0, 102, 65),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class ThemeModel with ChangeNotifier {
  ThemeData _currentTheme = lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void setTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }
}
