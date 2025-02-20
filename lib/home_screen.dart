import 'package:event_planning/bottom_nav_bar_item.dart';
import 'package:event_planning/create_event.dart';
import 'package:event_planning/home/home_tab.dart';
import 'package:event_planning/love/love_tab.dart';
import 'package:event_planning/map/map_tab.dart';
import 'package:event_planning/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageName = "";

  int selectedIndex = 0;

  List<Widget> tabs = [HomeTab(), MapTab(), LoveTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateEvent.routeName);
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          onTap: (value) {
            if (selectedIndex == value) return;
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                activeIcon: BottomNavBarItem(imageName: "home_selected"),
                label: l10n.home,
                icon: BottomNavBarItem(imageName: "home")),
            BottomNavigationBarItem(
                activeIcon: BottomNavBarItem(imageName: "map_selected"),
                label: l10n.map,
                icon: BottomNavBarItem(imageName: "map")),
            BottomNavigationBarItem(
                activeIcon: BottomNavBarItem(imageName: "love_selected"),
                label: l10n.love,
                icon: BottomNavBarItem(imageName: "love")),
            BottomNavigationBarItem(
                activeIcon: BottomNavBarItem(imageName: "profile_selected"),
                label: l10n.profile,
                icon: BottomNavBarItem(imageName: "profile")),
          ],
        ),
      ),
    ));
  }
}
