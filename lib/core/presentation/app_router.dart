import 'package:consumer_app/auth/presentation/screens/login_screen.dart';
import 'package:consumer_app/auth/presentation/screens/screens.dart';
import 'package:consumer_app/core/presentation/screens/home_screen.dart';
import 'package:consumer_app/core/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case IntroScreen.routeName:
        return MaterialPageRoute(builder: (_) => const IntroScreen());

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
