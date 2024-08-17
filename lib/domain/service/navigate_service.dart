import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<Object?>? navigateToReplacement(String routeName) {
    return navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  // Add other navigation methods as needed
}
