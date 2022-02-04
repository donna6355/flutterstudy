// ignore_for_file: unused_element, file_names, avoid_print
//https://medium.com/koahealth/how-to-track-screen-transitions-in-flutter-with-routeobserver-733984a90dea

import 'package:flutter/material.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  void _sendScreenView(PageRoute<dynamic> route) {
    var screenName = route.settings.name;
    print('screenName $screenName');
    // do something with it, ie. send it to your analytics service collector
  }

  // @override
  // void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
  //   super.didPush(route, previousRoute);
  //   if (route is PageRoute) {
  //     _sendScreenView(route);
  //   }
  // }

  // @override
  // void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
  //   super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  //   if (newRoute is PageRoute) {
  //     _sendScreenView(newRoute);
  //   }
  // }

  // @override
  // void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
  //   super.didPop(route, previousRoute);
  //   if (previousRoute is PageRoute && route is PageRoute) {
  //     _sendScreenView(previousRoute);
  //   }
  // }
}
