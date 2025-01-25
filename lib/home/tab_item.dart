import 'package:event_planning/app_theme.dart';
import 'package:event_planning/home/category.dart';
import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  Category category;
  bool isSelected;
  Color backgroundSelected;
  Color background;

  TabItem({
    required this.category,
    this.isSelected = false,
    required this.backgroundSelected,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? backgroundSelected : background,
        border: Border.all(
            color: !isSelected ? AppTheme.backgroundLight : AppTheme.primary,
            width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            category.icon,
            size: 25,
            color: isSelected ? AppTheme.primary : AppTheme.backgroundLight,
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
