import 'dart:io';

import 'package:akukom/features/auth/__auth.dart';
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

      case CreateAccountView.routeName:
        return pageRoute(const CreateAccountView());

      case CompleteCreateAccountView.routeName:
        return pageRoute(const CompleteCreateAccountView());

      case PhoneVerificationOtpView.routeName:
        return pageRoute(const PhoneVerificationOtpView());

      case VerificationSuccessfulView.routeName:
        return pageRoute(const VerificationSuccessfulView());

      case LoginView.routeName:
        return pageRoute(const LoginView());

      case ForgotPasswordView.routeName:
        return pageRoute(const ForgotPasswordView());

      case EmalVerificationOtpView.routeName:
        return pageRoute(const EmalVerificationOtpView());

      case NewPasswordView.routeName:
        return pageRoute(const NewPasswordView());

      case PasswordResetSuccessfulView.routeName:
        return pageRoute(const PasswordResetSuccessfulView());

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
