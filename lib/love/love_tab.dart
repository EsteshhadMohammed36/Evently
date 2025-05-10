import 'package:event_planning/app_theme.dart';
import 'package:event_planning/models/category.dart';
import 'package:flutter/material.dart';

class LoveTab extends StatefulWidget {
  @override
  State<LoveTab> createState() => _LoveTabState();
}

class _LoveTabState extends State<LoveTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: TextField(
            cursorColor: AppTheme.primary,
            style: textTheme.bodyMedium,
            decoration: InputDecoration(
                hintText: "Search for Event",
                hintStyle: textTheme.bodyMedium,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppTheme.primary, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppTheme.primary, width: 2)),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppTheme.primary,
                )),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Container();
          },
          itemCount: Category.categories.length,
        ))
      ],
    );
  }
}
