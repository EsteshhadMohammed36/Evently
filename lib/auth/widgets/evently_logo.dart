import 'package:flutter/material.dart';

class EventlyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.05),
      child: Image.asset(
        "assets/images/splash_logo.png",
        height: height * 0.25,
        width: double.infinity,
      ),
    );
  }
}
