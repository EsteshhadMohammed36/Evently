import 'package:event_planning/app_theme.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  String text;

  CustomContainer({required this.text});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppTheme.primary, width: 2)),
        child: Row(
          children: [
            Text(
              text,
              style: textTheme.bodyMedium!.copyWith(fontSize: 20),
            ),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              color: AppTheme.primary,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
