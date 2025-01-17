import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  String imageName;

  BottomNavBarItem({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height: 30,
      width: 30,
      fit: BoxFit.fill,
      "assets/images/${imageName}.png",
    );
  }
}
