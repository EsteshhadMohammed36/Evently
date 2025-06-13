import 'package:event_planning/models/l10n_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class L10nProvider with ChangeNotifier {
  String languageCode = "en";

  void changeLanguage(String lang) async {
    if (lang == languageCode) return;
    languageCode = lang;
    notifyListeners();
    //1- create sharedPrefs Object
    final prefs = await SharedPreferences.getInstance();
    // set values => save date
    prefs.setString("language", languageCode);
  }

  late List<L10nModel> menu;

  String? getlanguageName(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    menu = [
      L10nModel(language: l10n.ar, languageCode: "ar"),
      L10nModel(language: l10n.en, languageCode: "en"),
    ];

    return menu
        .firstWhere((l10n) => l10n.languageCode == languageCode)
        .language;
  }
}
