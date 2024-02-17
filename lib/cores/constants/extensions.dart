import 'package:akukom/cores/constants/__constants.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String get capitalizeFirstLetter => '${this[0].toUpperCase()}${substring(1)}';
  // capitalize first of each word
  String get capitalizeFirstOfEachWord {
    final words = split(' ');
    final capitalized = words.map((word) {
      return '${word[0].toUpperCase()}${word.substring(1)}';
    });
    return capitalized.join(' ');
  }
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

extension FamilyRequestTypeExtension on FamilyRequestType {
  String get label {
    switch (this) {
      case FamilyRequestType.sent:
        return AppStrings.sendRequests;
      case FamilyRequestType.received:
        return AppStrings.seeRequests;
      case FamilyRequestType.addFamily:
        return AppStrings.addFamily;
    }
  }

  String get icon {
    switch (this) {
      case FamilyRequestType.sent:
        return AppIcons.cameraSvg;
      case FamilyRequestType.received:
        return AppIcons.shareSvg;
      case FamilyRequestType.addFamily:
        return AppIcons.addSvg;
    }
  }
}

extension DateTimeFormatting on DateTime {
  String get formattedDate {
    return DateFormat('E, MMM dd yyyy').format(this);
  }

  String get formattedDateTime {
    return DateFormat('hh:mm a E, MMM dd yyyy').format(this);
  }

  String get formattedDateTimeShort {
    return DateFormat('MMM d, hh:mm a').format(this);
  }

  String get formattedDay {
    return DateFormat('EEE, MMM d').format(this);
  }

  String get formattedDateYYMMDD {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String get formattedDateYYMMDDTime {
    return DateFormat('yyyy-MM-dd hh:mm').format(this);
  }

  // get remaining time from now to the date in min hours days or weeks
  String timeAgo({
    bool numericDates = true,
    bool withTime = false,
  }) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);
    final time = DateFormat('hh:mm a').format(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago - $time' : 'Last week - - $time';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago - $time';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago - $time' : 'Yesterday - $time';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago - $time';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago - $time' : 'An hour ago - $time';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
