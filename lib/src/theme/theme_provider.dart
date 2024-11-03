import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void setTheme(ThemeMode? newTheme) {
    newTheme ??= ThemeMode.system;

    switch (newTheme) {
      case ThemeMode.system:
        var brightness =
            SchedulerBinding.instance.platformDispatcher.platformBrightness;
        if (brightness == Brightness.dark) {
          themeData = darkMode;
        } else {
          themeData = lightMode;
        }
        break;
      case ThemeMode.dark:
        themeData = darkMode;
        break;
      default:
        themeData = lightMode;
    }
  }
}
