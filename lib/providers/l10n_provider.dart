import 'package:event_planning/models/l10n_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10nProvider with ChangeNotifier {
  String languageCode = "en";

  void changeLanguage(String lang) {
    languageCode = lang;
    notifyListeners();
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
