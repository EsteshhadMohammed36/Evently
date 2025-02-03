import 'package:event_planning/app_theme.dart';
import 'package:event_planning/models/user_model.dart';
import 'package:event_planning/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var textTheme = Theme.of(context).textTheme;
    UserModel user = Provider.of<UserProvider>(context).currentUser!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: height * 0.2,
      decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(64))),
      child: Row(
        children: [
          Image.asset(
            "assets/images/route_image.png",
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user.name,
                style: textTheme.displayLarge,
              ),
              Text(
                user.email,
                style: textTheme.bodySmall!
                    .copyWith(color: AppTheme.backgroundLight),
              )
            ],
          )
        ],
      ),
    );
  }
}
