import 'package:event_planning/app_theme.dart';
import 'package:event_planning/home/event_item.dart';
import 'package:event_planning/providers/events_provider.dart';
import 'package:event_planning/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoveTab extends StatefulWidget {
  @override
  State<LoveTab> createState() => _LoveTabState();
}

class _LoveTabState extends State<LoveTab> {
  int selectedIndex = 0;
  late EventsProvider eventsProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      List<String> favIds = userProvider.currentUser!.favEventsIds;
      eventsProvider.filterFavorite(favIds);
    });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    eventsProvider = Provider.of<EventsProvider>(context);

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
            return EventItem(event: eventsProvider.favoriteEvents[index]);
          },
          itemCount: eventsProvider.favoriteEvents.length,
        ))
      ],
    );
  }
}
