import 'package:event_planning/app_theme.dart';
import 'package:event_planning/providers/theming_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomContainer extends StatelessWidget {
  String? text;
  List<DropdownMenuItem<dynamic>>? items;
  void Function(dynamic?)? onChanged;

  CustomContainer(
      {required this.text, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    ThemingProvider themingProvider = Provider.of<ThemingProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.primary, width: 2)),
      child: Row(
        children: [
          Text(
            text ?? "",
            style: textTheme.bodyMedium!.copyWith(fontSize: 20),
          ),
          Spacer(),
          DropdownButton(
              style: textTheme.bodyMedium!.copyWith(fontSize: 16),
              iconEnabledColor: AppTheme.primary,
              iconSize: 35,
              underline: SizedBox(),
              dropdownColor: themingProvider.isDark
                  ? AppTheme.backgroundDark
                  : AppTheme.backgroundLight,
              items: items,
              onChanged: onChanged)
        ],
      ),
    );
  }
}
