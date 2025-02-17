import 'package:event_planning/app_theme.dart';
import 'package:event_planning/auth/screens/login_screen.dart';
import 'package:event_planning/firebase_sevice.dart';
import 'package:event_planning/profile/custom_container.dart';
import 'package:event_planning/profile/profile_header.dart';
import 'package:event_planning/providers/theming_provider.dart';
import 'package:event_planning/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    ThemingProvider themingProvider = Provider.of<ThemingProvider>(context);

    return Column(
      children: [
        ProfileHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Language",
                style: themingProvider.isDark
                    ? textTheme.displayLarge!.copyWith(fontSize: 20)
                    : textTheme.displayMedium!.copyWith(fontSize: 20),
              ),
              CustomContainer(
                text: "Arabic",
              ),
              Text(
                "Theme",
                style: themingProvider.isDark
                    ? textTheme.displayLarge!.copyWith(fontSize: 20)
                    : textTheme.displayMedium!.copyWith(fontSize: 20),
              ),
              CustomContainer(
                text: themingProvider.getThemeName(themingProvider.theme),
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
                  "Logout",
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
