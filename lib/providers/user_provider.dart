import 'package:event_planning/firebase_sevice.dart';
import 'package:event_planning/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  void updateCurrentUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }

  bool checkIsFavorite(String eventId) {
    return currentUser!.favEventsIds.contains(eventId);
  }

  void addEventToUserFavList(String eventId) {
    //1-local : at favEventsIds list of user
    currentUser!.favEventsIds.add(eventId);
    //2- remote: at favEventsIds list of user document in firebase
    FirebaseService.addEventToFavorite(eventId);
    notifyListeners();
  }

  void removeEventfromUserFavList(String eventId) {
    //1-local : at favEventsIds list of user
    currentUser!.favEventsIds.remove(eventId);
    //2- remote: from favEventsIds list of user document in firebase
    FirebaseService.removeEventFromFavorite(eventId);
    //notifyListeners();
  }
}
