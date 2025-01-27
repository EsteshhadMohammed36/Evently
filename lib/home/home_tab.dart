import 'package:event_planning/firebase_sevice.dart';
import 'package:event_planning/home/event_item.dart';
import 'package:event_planning/home/home_header.dart';
import 'package:event_planning/models/event.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<Event> events = [];

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) getEvents();
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          HomeHeader(),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return EventItem(
                event: events[index],
              );
            },
            itemCount: events.length,
          ))
        ],
      )),
    );
  }

  getEvents() async {
    events = await FirebaseService.getEventsFromFirestore();
    events.sort(
      (event, nextEvent) {
        return event.dateTime.compareTo(nextEvent.dateTime);
      },
    );
    setState(() {});
  }
}
