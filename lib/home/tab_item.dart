import 'package:event_planning/app_theme.dart';
import 'package:event_planning/home/category.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  Category category;
  bool isSelected = false;

  TabItem({required this.category, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.white : Colors.transparent,
        border: Border.all(color: AppTheme.white, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            category.icon,
            size: 25,
            color: isSelected ? AppTheme.primary : AppTheme.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            category.name,
            style: isSelected
                ? Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppTheme.primary)
                : Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          //Image.asset("assets/tabs/${category.imageName}.png")
        ],
      ),
    );
  }
}
