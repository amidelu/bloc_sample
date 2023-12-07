import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GTheme {
  GTheme._();
  static ThemeData lightTheme = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: customPrimaryColor),
    colorScheme: const ColorScheme.light(
      primary: customPrimaryColor,
      secondary: customSecondaryColor,
      onError: errorColor,
    ),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: customPrimaryColor)),
    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      shadowColor: customPrimaryColor,
      color: lightBackgroundColor.withOpacity(0.8),
    ),
    iconTheme: const IconThemeData(
      color: customPrimaryColor,
      size: 24,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: customPrimaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: deactivatedColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: deactivatedColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: customSecondaryColor,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: customPrimaryColor),
    colorScheme: const ColorScheme.dark(
        primary: customPrimaryColor,
        secondary: customSecondaryColor,
        onError: errorColor),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: customPrimaryColor)),
    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      shadowColor: customPrimaryColor,
      color: darkBackgroundColor.withOpacity(0.8),
    ),
    iconTheme: const IconThemeData(
      color: customPrimaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: customPrimaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: deactivatedColor,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: deactivatedColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          width: 2,
          color: customSecondaryColor,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    ),
  );
}

// Global app colors

const customPrimaryColor = Color(0xff2096f3);
const customSecondaryColor = Colors.teal;

const darkBackgroundColor = Color(0xff303030);

const errorColor = Colors.red;
const appBarBackgroundColor = Color(0xff000513);
const backgroundColor = Color(0xff0070C0);

const zigzagBackground = Color(0xff1f8e69);

const linkColor = Color(0xff002060);
const customTextColor = Color(0xff4c505b);
const confirmButtonColor = Color(0xff119532);
const cardHighlightColor = Color(0xff97d5a7);

const whiteColor = Color(0xFFFFFFFF);
const lightBackgroundColor = Color(0xFFfafafa);
const blackColor = Color(0xFF000000);
const deactivatedColor = Color(0xFF8E8D8D);
const hintColor = Color(0x80C1B8B8);
const lightGreyColor = Color(0xFFE0DFDF);

const Color contentColorBlue = Color(0xFF3D6EB6);
const Color contentColorYellow = Color(0xFF6C5E30);
const Color contentColorPurple = Color(0xFF827DC2);

// Global app padding
const double hColumnHorizontal = 8.0;
const double hColumnVertical = 10.0;
