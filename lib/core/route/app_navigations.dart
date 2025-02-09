import 'package:flutter/material.dart';
import 'package:sign_in_sign_up/features/auth/auth_screen.dart';
import 'package:sign_in_sign_up/features/home/home_screen.dart';
import 'package:sign_in_sign_up/features/splash/splash_screen.dart';
import 'routes.dart';

class AppRoute {
  static final AppRoute _singltone = AppRoute._internal();

  factory AppRoute() {
    return _singltone;
  }
  AppRoute._internal();
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteLink.auth:
        return pageRouteBuilder(
          page: AuthScreen(),
        );

      case RouteLink.home:
        return pageRouteBuilder(
          page: HomeScreen(),
        );

      case RouteLink.splash:
        return pageRouteBuilder(
          page: SplashScreen(),
        );
      default:
        return pageRouteBuilder(
          page: const Scaffold(),
        );
    }
  }

  MaterialPageRoute pageRouteBuilder({
    required Widget page,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        return page;
      },
    );
  }
}
