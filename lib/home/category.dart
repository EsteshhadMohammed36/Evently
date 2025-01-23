import 'package:flutter/material.dart';

class Category {
  String id;
  String name;
  String? imageName;
  IconData icon;

  Category({
    required this.id,
    required this.name,
    this.imageName,
    required this.icon,
  });

  static List<Category> categories = [
    Category(
      id: "1",
      name: "Birthday",
      imageName: "birthday",
      icon: Icons.cake_outlined,
    ),
    Category(
      id: "2",
      name: "Meeting",
      imageName: "meeting",
      icon: Icons.work_history_outlined,
    ),
    Category(
      id: "3",
      name: "Exhibition",
      imageName: "exhibition",
      icon: Icons.punch_clock_outlined,
    ),
    Category(
      id: "4",
      name: "Eating",
      imageName: "eating",
      icon: Icons.restaurant,
    ),
    Category(
      id: "5",
      name: "Book Club",
      imageName: "book_club",
      icon: Icons.menu_book_rounded,
    ),
    Category(
      id: "6",
      name: "Workshop",
      imageName: "workshop",
      icon: Icons.workspaces_outline,
    ),
    Category(
      id: "7",
      name: "Gaming",
      imageName: "gaming",
      icon: Icons.videogame_asset_sharp,
    ),
    Category(
      id: "8",
      name: "Sport",
      imageName: "sport",
      icon: Icons.directions_bike,
    ),
    Category(
      id: "9",
      name: "Holiday",
      imageName: "holiday",
      icon: Icons.holiday_village_outlined,
    ),
  ];
}
