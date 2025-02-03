import 'package:event_planning/app_theme.dart';
import 'package:event_planning/home/tab_item.dart';
import 'package:event_planning/models/category_model.dart';
import 'package:event_planning/providers/events_provider.dart';
import 'package:event_planning/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);
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
              Provider.of<UserProvider>(context).currentUser!.name,
              style: textTheme.displayLarge,
            ),
            DefaultTabController(
                length: CategoryModel.categories.length + 1,
                child: TabBar(
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: EdgeInsets.only(left: 8, right: 8, top: 16),
                    isScrollable: true,
                    onTap: (index) {
                      if (selectedIndex == index) return;
                      selectedIndex = index;
                      index == 0
                          ? eventsProvider.filterEvents(null)
                          : eventsProvider.filterEvents(
                              CategoryModel.categories[index - 1]);
                    },
                    tabs: [
                      TabItem(
                          category: CategoryModel(
                              id: "0", name: "All", icon: Icons.all_out),
                          backgroundSelected: AppTheme.backgroundLight,
                          isSelected: selectedIndex == 0,
                          background: Colors.transparent),
                      ...CategoryModel.categories
                          .map((category) => TabItem(
                              backgroundSelected: AppTheme.backgroundLight,
                              background: Colors.transparent,
                              isSelected: selectedIndex ==
                                  CategoryModel.categories.indexOf(category) +
                                      1,
                              category: category))
                          .toList()
                    ]))
          ],
        ),
      ),
    );
  }
}
