import 'package:event_planning/firebase_sevice.dart';
import 'package:event_planning/models/category_model.dart';
import 'package:event_planning/models/event_model.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> allEvents = [];
  List<EventModel> filteredEvents = [];
  List<EventModel> favoriteEvents = [];
  CategoryModel? selectedCategory;

  getEvents() async {
    allEvents = await FirebaseService.getEventsFromFirestore();
    //1-sorting
    allEvents.sort(
      (event, nextEvent) {
        return event.dateTime.compareTo(nextEvent.dateTime);
      },
    );
    //2-filtering
    filterEvents(selectedCategory);
  }

  //2- change selected category
  filterEvents(CategoryModel? category) {
    selectedCategory = category;
    if (category == null)
      filteredEvents = allEvents;
    else
      filteredEvents =
          allEvents.where((event) => event.category == category).toList();
    notifyListeners();
  }

  void filterFavorite(List<String> favEventsIds) {
    favoriteEvents =
        allEvents.where((event) => favEventsIds.contains(event.id)).toList();
    notifyListeners();
  }
}
