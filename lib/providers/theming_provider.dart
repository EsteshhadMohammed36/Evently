import 'package:event_planning/models/theme_model.dart';
import 'package:flutter/material.dart';

class ThemingProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  bool get isDark => theme == ThemeMode.dark;

  changeTheme(ThemeMode themeMode) {
    theme = themeMode;
    notifyListeners();
  }

  List<ThemeModel> menu = [
    ThemeModel(themeName: "Light", themeMode: ThemeMode.light),
    ThemeModel(themeName: "Dark", themeMode: ThemeMode.dark),
  ];

  String? getThemeName(ThemeMode themeMode) {
    return menu
        .firstWhere((themeModel) => themeModel.themeMode == theme)
        .themeName;
  }
}
