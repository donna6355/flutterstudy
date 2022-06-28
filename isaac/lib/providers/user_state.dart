import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  String _userName = '';
  String get userName => _userName;
  void updateName(String input) {
    _userName = input;
    notifyListeners();
  }
}
