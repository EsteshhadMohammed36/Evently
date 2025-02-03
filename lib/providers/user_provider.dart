import 'package:event_planning/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  void updateCurrentUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }
}
