import 'package:event_planning/firebase_sevice.dart';
import 'package:event_planning/models/category.dart';
import 'package:event_planning/models/event.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier {
  List<Event> allEvents = [];
  List<Event> filteredEvents = [];
  Category? selectedCategory;

  getEvents() async {
    allEvents = await FirebaseService.getEventsFromFirestore();
    allEvents.sort(
      (event, nextEvent) {
        return event.dateTime.compareTo(nextEvent.dateTime);
      },
    );
    filterEvents(selectedCategory);
  }

  filterEvents(Category? category) {
    selectedCategory = category;
    if (category == null)
      filteredEvents = allEvents;
    else
      filteredEvents =
          allEvents.where((event) => event.category == category).toList();
    notifyListeners();
  }
}
