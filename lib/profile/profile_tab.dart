import 'package:event_planning/app_theme.dart';
import 'package:event_planning/auth/screens/login_screen.dart';
import 'package:event_planning/firebase_sevice.dart';
import 'package:event_planning/profile/custom_container.dart';
import 'package:event_planning/profile/profile_header.dart';
import 'package:event_planning/providers/l10n_provider.dart';
import 'package:event_planning/providers/theming_provider.dart';
import 'package:event_planning/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var l10n = AppLocalizations.of(context)!;
    ThemingProvider themingProvider = Provider.of<ThemingProvider>(context);
    L10nProvider l10nProvider = Provider.of<L10nProvider>(context);

    return Column(
      children: [
        ProfileHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.lang,
                style: themingProvider.isDark
                    ? textTheme.displayLarge!.copyWith(fontSize: 20)
                    : textTheme.displayMedium!.copyWith(fontSize: 20),
              ),
              CustomContainer(
                text: l10nProvider.getlanguageName(context),
                items: Provider.of<L10nProvider>(context, listen: false)
                    .menu
                    .map((l10n) => DropdownMenuItem(
                          //language coooooooode value not language name
                          value: l10n.languageCode,
                          child: Text(l10n.language ?? ""),
                        ))
                    .toList(),
                onChanged: (selectedLanguage) {
                  if (selectedLanguage != null) {
                    l10nProvider.changeLanguage(selectedLanguage);
                  }
                },
              ),
              Text(
                l10n.theme,
                style: themingProvider.isDark
                    ? textTheme.displayLarge!.copyWith(fontSize: 20)
                    : textTheme.displayMedium!.copyWith(fontSize: 20),
              ),
              CustomContainer(
                text: themingProvider.getThemeName(
                    themingProvider.theme, context),
                items: Provider.of<ThemingProvider>(context, listen: false)
                    .menu
                    .map((theme) => DropdownMenuItem(
                          value: theme.themeMode,
                          child: Text(theme.themeName ?? ""),
                        ))
                    .toList(),
                onChanged: (selectedTheme) {
                  if (selectedTheme != null) {
                    themingProvider.changeTheme(selectedTheme);
                  }
                },
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          decoration: BoxDecoration(
            color: AppTheme.redColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: () {
              FirebaseService.signOut();
              Provider.of<UserProvider>(context, listen: false)
                  .updateCurrentUser(null);
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: AppTheme.backgroundLight,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  l10n.logout,
                  style: textTheme.bodyLarge,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
