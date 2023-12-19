import 'package:flutter/material.dart';
import 'user.dart';

class UserProvider extends ChangeNotifier {
  User _curLoggedIn = User(id: 0, email: '', name: ''); // Initialize with default values

  User get curLoggedIn => _curLoggedIn;

  void setLoggedInUser(User user) {
    _curLoggedIn = user;
    notifyListeners();
  }
}
