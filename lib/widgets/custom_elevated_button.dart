import 'package:event_planning/app_theme.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {required this.onPressed,
      required this.text,
      this.isGoogle = false,
      this.backgroundColor,
      this.foregroundColor});

  void Function()? onPressed;
  bool isGoogle;
  String text;
  Color? foregroundColor;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: AppTheme.primary),
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          isGoogle
              ? Row(
                  children: [
                    Image.asset(
                      "assets/images/google_icon.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(text)
                  ],
                )
              : Text(text),
        ]),
      ),
    );
  }
}
