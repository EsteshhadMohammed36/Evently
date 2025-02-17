import 'package:event_planning/home/event_item.dart';
import 'package:event_planning/home/home_header.dart';
import 'package:event_planning/providers/events_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          HomeHeader(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return EventItem(
                event: eventsProvider.filteredEvents[index],
              );
            },
            itemCount: eventsProvider.filteredEvents.length,
          ))
        ],
      )),
    );
  }
}
