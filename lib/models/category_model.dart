import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  String getLocalization(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    switch (name) {
      case "Sport":
        return l10n.sport;
      case "Birthday":
        return l10n.birthday;
      case "Exhibition":
        return l10n.exhibition;
      case "Eating":
        return l10n.eating;
      case "Book Club":
        return l10n.bookClub;
      case "Workshop":
        return l10n.workShop;
      case "Gaming":
        return l10n.gaming;
      case "Holiday":
        return l10n.holiday;
      case "Meeting":
        return l10n.meeting;
      default:
        return name;
    }
  }

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
      name: "Holiday",
      imageName: "holiday",
      icon: Icons.holiday_village_outlined,
    ),
    CategoryModel(
      id: "9",
      name: "Meeting",
      imageName: "meeting",
      icon: Icons.work_history_outlined,
    ),
  ];
  static List<CategoryModel> categoriesDark = [
    CategoryModel(
      id: "1",
      name: "Sport",
      imageName: "sport_dark",
      icon: Icons.directions_bike,
    ),
    CategoryModel(
      id: "2",
      name: "Birthday",
      imageName: "birthday_dark",
      icon: Icons.cake_outlined,
    ),
    CategoryModel(
      id: "3",
      name: "Exhibition",
      imageName: "exhibition_dark",
      icon: Icons.punch_clock_outlined,
    ),
    CategoryModel(
      id: "4",
      name: "Eating",
      imageName: "eating_dark",
      icon: Icons.restaurant,
    ),
    CategoryModel(
      id: "5",
      name: "Book Club",
      imageName: "book_club_dark",
      icon: Icons.menu_book_rounded,
    ),
    CategoryModel(
      id: "6",
      name: "Workshop",
      imageName: "workshop_dark",
      icon: Icons.workspaces_outline,
    ),
    CategoryModel(
      id: "7",
      name: "Gaming",
      imageName: "gaming_dark",
      icon: Icons.videogame_asset_sharp,
    ),
    CategoryModel(
      id: "8",
      name: "Holiday",
      imageName: "holiday_dark",
      icon: Icons.holiday_village_outlined,
    ),
    CategoryModel(
      id: "9",
      name: "Meeting",
      imageName: "meeting_dark",
      icon: Icons.work_history_outlined,
    ),
  ];
}
