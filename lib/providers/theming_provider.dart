import 'package:event_planning/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemingProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  bool get isDark => theme == ThemeMode.dark;

  changeTheme(ThemeMode themeMode) async {
    if (themeMode == theme) return;
    theme = themeMode;
    notifyListeners();
    //1- create sharedPrefs Object
    final prefs = await SharedPreferences.getInstance();
    // set values => save date
    prefs.setBool("isDark", theme == ThemeMode.dark);
  }

  late List<ThemeModel> menu;

  String? getThemeName(ThemeMode themeMode, BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    menu = [
      ThemeModel(themeName: l10n.light, themeMode: ThemeMode.light),
      ThemeModel(themeName: l10n.dark, themeMode: ThemeMode.dark),
    ];
    return menu
        .firstWhere((themeModel) => themeModel.themeMode == theme)
        .themeName;
  }
}
