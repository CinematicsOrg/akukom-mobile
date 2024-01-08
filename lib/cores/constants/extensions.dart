import 'package:akukom/cores/constants/__constants.dart';

extension StringExtension on String {
  String get capitalizeFirstLetter => '${this[0].toUpperCase()}${substring(1)}';
}

extension NavBarExtension on NavBarType {
  String get label {
    switch (this) {
      case NavBarType.home:
        return 'Home';
      case NavBarType.gallery:
        return 'Gallery';
      case NavBarType.messages:
        return 'Messages';
      case NavBarType.profile:
        return 'Proile';
    }
  }

  String get image {
    switch (this) {
      case NavBarType.home:
        return AppIcons.homeSvg;
      case NavBarType.gallery:
        return AppIcons.gallerySvg;
      case NavBarType.messages:
        return AppIcons.chatSvg;
      case NavBarType.profile:
        return AppIcons.chatSvg;
    }
  }

  String get selectedImage {
    switch (this) {
      case NavBarType.home:
        return AppIcons.homeSelectedSvg;
      case NavBarType.gallery:
        return AppIcons.gallerySelectedSvg;
      case NavBarType.messages:
        return AppIcons.chatSvg;
      case NavBarType.profile:
        return AppIcons.chatSvg;
    }
  }
}

extension ProfileSettingsListExtension on ProfileSettingsList {
  String get label {
    switch (this) {
      case ProfileSettingsList.account:
        return AppStrings.yourAccount;
      case ProfileSettingsList.notificationPreferences:
        return AppStrings.notificationPreferences;
      case ProfileSettingsList.privacyAndSafety:
        return AppStrings.privacyAndSafety;
      case ProfileSettingsList.logout:
        return AppStrings.logout;
    }
  }

  String get icon {
    switch (this) {
      case ProfileSettingsList.account:
        return AppIcons.profileSvg;
      case ProfileSettingsList.notificationPreferences:
        return AppIcons.notificationSvg;
      case ProfileSettingsList.privacyAndSafety:
        return AppIcons.lockSvg;
      case ProfileSettingsList.logout:
        return AppIcons.logoutSvg;
    }
  }
}

extension AccountSettingsListExtension on AccountSettingsList {
  String get label {
    switch (this) {
      case AccountSettingsList.accountInfo:
        return AppStrings.accountInfo;
      case AccountSettingsList.contactSync:
        return AppStrings.contactSync;
      case AccountSettingsList.changePassword:
        return AppStrings.changeYourPassword;
      case AccountSettingsList.deactivateAccount:
        return AppStrings.deactivateAccount;
    }
  }

  String get icon {
    switch (this) {
      case AccountSettingsList.accountInfo:
        return AppIcons.profileSvg;
      case AccountSettingsList.contactSync:
        return AppIcons.keySvg;
      case AccountSettingsList.changePassword:
        return AppIcons.keySvg;
      case AccountSettingsList.deactivateAccount:
        return AppIcons.lockSvg;
    }
  }
}
