import 'package:flutter/material.dart';

class NavigationService {
  late final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> navigateToReplacement(
    String _routeName, {
    Object? arguments,
  }) {
    return navigationKey.currentState!
        .pushReplacementNamed(_routeName, arguments: arguments);
  }

  Future<dynamic> navigateTo(
    String _routeName, {
    Object? arguments,
  }) {
    return navigationKey.currentState!
        .pushNamed(_routeName, arguments: arguments);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute _routeName) {
    return navigationKey.currentState!.push(_routeName);
  }

  void goback() {
    return navigationKey.currentState!.pop();
  }
}
