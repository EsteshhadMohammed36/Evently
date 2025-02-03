import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  String? imageName;
  IconData icon;

  CategoryModel({
    required this.id,
    required this.name,
    this.imageName,
    required this.icon,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: "1",
      name: "Sport",
      imageName: "sport",
      icon: Icons.directions_bike,
    ),
    CategoryModel(
      id: "2",
      name: "Birthday",
      imageName: "birthday",
      icon: Icons.cake_outlined,
    ),
    CategoryModel(
      id: "3",
      name: "Exhibition",
      imageName: "exhibition",
      icon: Icons.punch_clock_outlined,
    ),
    CategoryModel(
      id: "4",
      name: "Eating",
      imageName: "eating",
      icon: Icons.restaurant,
    ),
    CategoryModel(
      id: "5",
      name: "Book Club",
      imageName: "book_club",
      icon: Icons.menu_book_rounded,
    ),
    CategoryModel(
      id: "6",
      name: "Workshop",
      imageName: "workshop",
      icon: Icons.workspaces_outline,
    ),
    CategoryModel(
      id: "7",
      name: "Gaming",
      imageName: "gaming",
      icon: Icons.videogame_asset_sharp,
    ),
    CategoryModel(
      id: "8",
      name: "Sport",
      imageName: "sport",
      icon: Icons.directions_bike,
    ),
    CategoryModel(
      id: "9",
      name: "Meeting",
      imageName: "meeting",
      icon: Icons.work_history_outlined,
    ),
  ];
}
