import 'package:event_planning/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemingProvider with ChangeNotifier {
  ThemeMode theme = ThemeMode.light;

  bool get isDark => theme == ThemeMode.dark;

  changeTheme(ThemeMode themeMode) {
    theme = themeMode;
    notifyListeners();
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
