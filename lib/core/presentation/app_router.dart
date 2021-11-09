import 'package:consumer_app/profile/presentation/profile_screen.dart';

import '../../auth/presentation/screens/login_screen.dart';
import '../../auth/presentation/screens/screens.dart';
import 'screens/home_screen.dart';
import 'screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case IntroScreen.routeName:
        return MaterialPageRoute(builder: (_) => const IntroScreen());

      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case ProfileScreen.routeName:
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => ProfileScreen(profileID: args));
        } else {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text(
                    'No route defined for ${routeSettings.name} or invalid args'),
              ),
            ),
          );
        }

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
