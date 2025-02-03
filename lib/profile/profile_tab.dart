import 'package:event_planning/app_theme.dart';
import 'package:event_planning/auth/screens/login_screen.dart';
import 'package:event_planning/firebase_sevice.dart';
import 'package:event_planning/profile/custom_container.dart';
import 'package:event_planning/profile/profile_header.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
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
                style: textTheme.displayMedium!.copyWith(fontSize: 20),
              ),
              CustomContainer(
                text: "Arabic",
              ),
              Text(
                "Theme",
                style: textTheme.displayMedium!.copyWith(fontSize: 20),
              ),
              CustomContainer(
                text: "Light",
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
