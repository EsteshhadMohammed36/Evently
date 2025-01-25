import 'package:event_planning/app_theme.dart';
import 'package:event_planning/home/category.dart';
import 'package:flutter/material.dart';

class EventItem extends StatefulWidget {
  int index;

  EventItem({required this.index});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var height = MediaQuery.sizeOf(context).height;
    return Container(
        height: height * 0.25,
        margin: EdgeInsets.only(top: 16, left: 16, right: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(
                  "assets/tabs/${Category.categories[widget.index].imageName}.png"),
              fit: BoxFit.fill,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Center(
                child: Text(
                  " 21\nNov",
                  style: textTheme.bodyMedium!.copyWith(fontSize: 20),
                ),
              ),
              margin: EdgeInsets.all(8),
              height: height * 0.06,
              width: MediaQuery.sizeOf(context).width * 0.12,
              decoration: BoxDecoration(
                  color: AppTheme.backgroundLight,
                  borderRadius: BorderRadius.circular(8)),
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    color: AppTheme.backgroundLight,
                    borderRadius: BorderRadius.circular(8)),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text(
                        ("Meeting for Updating The Development Method "),
                        style: textTheme.displayMedium,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {
                            isPressed = !isPressed;
                            setState(() {});
                          },
                          icon: Icon(isPressed
                              ? Icons.favorite
                              : Icons.favorite_border_outlined)),
                    )
                  ],
                )),
          ],
        ));
  }
}
