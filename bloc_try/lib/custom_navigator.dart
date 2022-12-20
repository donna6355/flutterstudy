import 'package:flutter/material.dart';

class CustomNavigator {
  CustomNavigator._();
  static late GlobalKey<NavigatorState> _navKey;

  static void setNavKey(GlobalKey<NavigatorState> key) {
    _navKey = key;
  }

  static void pushTo(String route) {
    _navKey.currentState?.pushNamed(route);
  }
}

//Navigator .of(context).push('')
//Navigator == Material app instance
// of(context) from this context which has parent's info bottom up to search navigator instance
// assign global key to material app and access there by this key!