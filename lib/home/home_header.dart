import 'package:event_planning/app_theme.dart';
import 'package:event_planning/home/category.dart';
import 'package:event_planning/home/tab_item.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          color: AppTheme.primary),
      child: Padding(
        padding: EdgeInsets.only(top: 24, left: 16, bottom: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.start,
              "Welcome Back ✨",
              style: textTheme.displaySmall,
            ),
            Text(
              "Esteshhad Mohammed",
              style: textTheme.displayLarge,
            ),
            DefaultTabController(
                length: Category.categories.length,
                child: TabBar(
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.only(left: 8, right: 8, top: 16),
                    isScrollable: true,
                    onTap: (index) {
                      selectedIndex = index;
                      setState(() {});
                    },
                    tabs: Category.categories
                        .map((category) => TabItem(
                            isSelected: selectedIndex ==
                                Category.categories.indexOf(category),
                            category: category))
                        .toList()))
          ],
        ),
      ),
    );
  }
}
