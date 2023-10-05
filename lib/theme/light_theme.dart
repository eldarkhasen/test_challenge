import 'package:flutter/material.dart';
import '/core/utils/helpers.dart';
import '/theme/constants.dart';

import 'input_decoration.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: "TTNorms",
    primarySwatch: MaterialColor(primaryColor.value, getSwatch(primaryColor)),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    iconTheme: const IconThemeData(color: blackColor),
    inputDecorationTheme: lightInputDecorationTheme,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontFamily: "TTNorms",
          color: secondaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 14),
      bodyMedium: TextStyle(
        color: secondaryTextColor,
        fontFamily: "TTNorms",
      ),
      displayLarge: TextStyle(
          fontSize: 24,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w700,
          color: secondaryTextColor),
      displayMedium: TextStyle(
          fontSize: 20,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w600,
          color: secondaryTextColor),
      displaySmall: TextStyle(
          fontSize: 18,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w600,
          color: secondaryTextColor),
      labelLarge: TextStyle(
          fontSize: 16,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w600,
          color: secondaryTextColor),
      labelMedium: TextStyle(
          fontSize: 14,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w500,
          color: secondaryTextColor),
    ),
  );
}
