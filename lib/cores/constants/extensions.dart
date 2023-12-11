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
