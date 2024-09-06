import 'package:flutter/material.dart';
import 'package:personalworkout/themes/dark_mode.dart';
import 'package:personalworkout/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  // Initially set it as a light mode
  ThemeData _themeData = lightmode;

  // Get the current theme data
  ThemeData get themeData => _themeData;

  // Is it dark mode currently
  bool get isDarkMode => _themeData == darkmode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners(); // Notify listeners when the theme changes
  }

  void toggleTheam() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}
