import 'dart:io';

import 'package:akukom/opening_account_screen.dart';
import 'package:akukom/opening_screen.dart';
import 'package:akukom/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'error_route_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final Object? args = settings.arguments;

    switch (settings.name) {
      case SplashScreen.routeName:
        return pageRoute(const SplashScreen());

      case OpeningScreen.routeName:
        return pageRoute(const OpeningScreen());

      case OpeningAccountScreen.routeName:
        return pageRoute(const OpeningAccountScreen());

      default:
        return errorRoute();
    }
  }

  static PageRoute pageRoute(Widget page) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => page);
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
