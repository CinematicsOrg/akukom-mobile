import 'dart:io';

import 'package:akukom/camera.dart';
import 'package:akukom/features/auth/__auth.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:akukom/features/main_layout/presentation/views/main_layout.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:akukom/features/profile/presentation/views/privacy_safety_view.dart';
import 'package:akukom/features/story/__story.dart';
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
        final phone = settings.arguments as String;
        return pageRoute(PhoneVerificationOtpView(
          phone: phone,
        ));

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

      case MainLayout.routeName:
        return pageRoute(const MainLayout());

      case NotificationsView.routeName:
        return pageRoute(const NotificationsView());

      case EditProfileView.routeName:
        return pageRoute(const EditProfileView());

      case SettingView.routeName:
        return pageRoute(const SettingView());

      case AccountProfileView.routeName:
        return pageRoute(const AccountProfileView());

      case YourAccountInfoView.routeName:
        return pageRoute(const YourAccountInfoView());

      case ContactSyncingView.routeName:
        return pageRoute(const ContactSyncingView());

      case CameraScreen.routeName:
        return pageRoute(const CameraScreen());

      case ProfileChangePasswordView.routeName:
        return pageRoute(const ProfileChangePasswordView());

      case NotificationPrefrencesView.routeName:
        return pageRoute(const NotificationPrefrencesView());

      case PrivacySafetyView.routeName:
        return pageRoute(const PrivacySafetyView());

      case FamilyGroupScreen.routeName:
        return pageRoute(const FamilyGroupScreen());

      case CreateFamilyGroupScreen.routeName:
        return pageRoute(const CreateFamilyGroupScreen());

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
