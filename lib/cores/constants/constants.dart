import 'package:akukom/cores/constants/__constants.dart';

class AppConstants {
  const AppConstants();

  static const List navbarItems = [
    NavBarType.home,
    NavBarType.gallery,
    NavBarType.messages,
    NavBarType.profile,
  ];

  static const List profileSettingsList = [
    ProfileSettingsList.account,
    ProfileSettingsList.notificationPreferences,
    ProfileSettingsList.privacyAndSafety,
    ProfileSettingsList.logout,
  ];

  static const List accountSettingsList = [
    AccountSettingsList.accountInfo,
    AccountSettingsList.contactSync,
    AccountSettingsList.changePassword,
    AccountSettingsList.deactivateAccount,
  ];
}
