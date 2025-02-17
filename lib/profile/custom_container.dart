import 'package:event_planning/app_theme.dart';
import 'package:event_planning/providers/theming_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomContainer extends StatelessWidget {
  String? text;
  CustomContainer({
    required this.text,
  });

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
            dropdownColor: themingProvider.isDark
                ? AppTheme.backgroundDark
                : AppTheme.backgroundLight,
            iconEnabledColor: AppTheme.primary,
            iconSize: 35,
            underline: SizedBox(),
            items: Provider.of<ThemingProvider>(context, listen: false)
                .menu
                .map((theme) => DropdownMenuItem(
                      value: theme.themeMode,
                      child: Text(theme.themeName ?? ""),
                    ))
                .toList(),
            onChanged: (selectedTheme) {
              if (selectedTheme != null) {
                themingProvider.changeTheme(selectedTheme);
              }
            },
          )
        ],
      ),
    );
  }
}
