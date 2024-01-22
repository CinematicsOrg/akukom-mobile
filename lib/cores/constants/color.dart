import 'package:flutter/material.dart';

class AppColors {
  // Primary shades for light theme
  static const Color primaryLight =
      Color(0xFF8FFCE1); // Light shade of primary color
  static const Color primaryContainerLight =
      Color(0xFFA0FFEB); // 40% lighter shade of primary color
  static const Color onPrimaryLight =
      Color(0xFFDFFFFF); // 90% lighter shade of primary color
  static const Color onPrimaryContainerLight =
      Color(0xFF53C0A5); // 10% lighter shade of primary color

  // Primary shades for dark theme
  static const Color primaryDark =
      Color(0xFF67D4B9); // Dark shade of primary color
  static const Color onPrimaryDark =
      Color(0xFF80E6D3); // 80% darker shade of primary color
  static const Color primaryContainerDark =
      Color(0xFF4EB59A); // 20% darker shade of primary color
  static const Color onPrimaryContainerDark =
      Color(0xFF7BE8CD); // 30% darker shade of primary color

  // Tonal palette for the primary color

  // Primary Secondary shades for light theme
  static const Color primarySecondaryLight = Color(0xFFFF8958); // lightest
  static const Color primarySecondaryContainerLight = Color(0xFFFFE4CD);
  static const Color primaryOnSecondaryContainerLight = Color(0xFFDB6130);

  // Primary Secondary shades for dark theme
  static const Color primarySecondaryDark = Color(0xFFFFDABB); // lightest
  static const Color primaryOnSecondaryDark = Color(0xFFEF7544);
  static const Color primarySecondaryContainerDark = Color(0xFFFF8958);
  static const Color primaryOnSecondaryContainerDark = Color(0xFFFFE4CD);

  // Secondary shades for light theme
  static const Color secondaryLight = Color(0xFF5A6572);
  static const Color secondaryContainerLight = Color(0xFFBEC9D6);
  static const Color onSecondaryContainerLight = Color(0xFF1E2936);

  // Secondary shades for dark theme
  static const Color secondaryDark = Color(0xFFAAB5C2); // Insert color value
  static const Color onSecondaryDark = Color(0xFF323D4A); // Insert color value
  static const Color secondaryContainerDark =
      Color(0xFF46515E); // Insert color value
  static const Color onSecondaryContainerDark =
      Color(0xFFBEC9D6); // Insert color value

  // Success Light colors
  static const Color successLight = Color(0xFF44C468);
  static const Color successSecondaryLight = Color(0xFFA8FFCC);
  static const Color successOnSecondaryContainerLight = Color(0xFF08882C);

  // Success Dark colors
  static const Color successDark = Color(0xFF94FFB8);
  static const Color successOnSecondaryDark = Color(0xFF1C9C40);
  static const Color successSecondaryContainerDark = Color(0xFF30B054);
  static const Color successOnSecondaryContainerDark = Color(0xFFA8FFCC);

  // Error colors Light
  static const Color errorLight = Color(0xFFFF6741);
  static const Color onErrorLight = Color(0xFFFFFFFF);
  static const Color errorContainerLight = Color(0xFFFFC9B3);
  static const Color onErrorContainerLight = Color(0xFFD42B05);

  // Error colors Dark
  static const Color errorDark = Color(0xFFFFB495);
  static const Color onErrorDark = Color(0xFFE83F19);
  static const Color errorContainerDark = Color(0xFFFC532D);
  static const Color onErrorContainerDark = Color(0xFFFFC9B3);

  // Background colors for light theme
  static const Color backgroundLight = Color(0xFFF1F1F1);
  static const Color onBackgroundLight = Color(0xFF5B5B5B);
  static const Color surfaceLight = Color(0xFFF1F1F1);
  static const Color onSurfaceLight = Color(0xFF5B5B5B);

  // Background colors for dark theme
  static const Color backgroundDark = Color(0xFF5B5B5B);
  static const Color onBackgroundDark = Color(0xFFDDDDDD);
  static const Color surfaceDark = Color(0xFF5B5B5B);
  static const Color onSurfaceDark = Color(0xFFDDDDDD);
}

// const Color kcDarkTextColor = Color(0xff121111);
const Color kcPrimaryColor = Color(0xffFF8958);
const Color kcSecondaryColor = Color(0xFF11A27F);

const Color kcTextColor = Color(0xFF111213);
const Color kcSoftTextColor = Color(0xFF4F5E62);

const Color kcButtonColor = Color(0xffFF8958);
const Color kcInactiveButtonColor = Color(0xFFFFC4AB);

const Color kcGreyLight = Color(0xffEEEEEE);
const Color kcGrey400 = Color(0xffBDBDBD);
const Color kcGrey600 = Color(0xff757575);
const Color kcGrey800 = Color(0xff424242);
const Color kcGrey200 = Color(0xffEEEEEE);
const Color kcGrey100 = Color(0xffF5F5F5);
const Color kcTextGrey = Color(0xff8E8E8E);

const Color kcWhite = Color(0xFFFFFFFF);
const Color kcBlack = Color(0xFF000000);
const Color kcBlack700 = Color(0xFF616161);
const Color kcBackground = Color.fromARGB(255, 255, 255, 255);
const Color kcDarkBackground = Color(0xFF121212);

const Color kcSuccessColor = Color(0xff15DC71);
const Color kcErrorColor = Color(0xffFF0202);

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kcBackground,
    primaryColor: kcPrimaryColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: kcGrey400,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kcPrimaryColor,
    ),
    colorScheme: const ColorScheme.light(primary: kcPrimaryColor)
        .copyWith(error: kcErrorColor),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: kcPrimaryColor,
    textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.white)),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kcGrey600,
      selectionColor: kcGrey600,
      selectionHandleColor: kcGrey600,
    ),
    colorScheme: const ColorScheme.dark(primary: kcPrimaryColor)
        .copyWith(error: kcErrorColor),
  );
}

// Them Checker
extension DarkMode on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
