import 'package:event_planning/home/event_item.dart';
import 'package:event_planning/home/home_header.dart';
import 'package:event_planning/models/category.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          HomeHeader(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return EventItem(
                index: index,
              );
            },
            itemCount: Category.categories.length,
          ))
        ],
      )),
    );
  }
}
