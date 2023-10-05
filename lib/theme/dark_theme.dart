import 'package:flutter/material.dart';
import '/core/utils/helpers.dart';
import '/theme/constants.dart';

import 'input_decoration.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
    fontFamily: "TTNorms",
    primarySwatch: MaterialColor(primaryColor.value, getSwatch(primaryColor)),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColorDark,
    iconTheme: const IconThemeData(color: blackColor),
    inputDecorationTheme: darkInputDecorationTheme,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          fontFamily: "TTNorms",
          color: whiteColor,
          fontWeight: FontWeight.w400,
          fontSize: 14),
      bodyMedium: TextStyle(
        color: whiteColor,
        fontFamily: "TTNorms",
      ),
      displayLarge: TextStyle(
          fontSize: 24,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w700,
          color: whiteColor),
      displayMedium: TextStyle(
          fontSize: 20,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w600,
          color: whiteColor),
      displaySmall: TextStyle(
          fontSize: 18,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w600,
          color: whiteColor),
      labelLarge: TextStyle(
          fontSize: 16,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w600,
          color: whiteColor),
      labelMedium: TextStyle(
          fontSize: 14,
          fontFamily: "TTNorms",
          fontWeight: FontWeight.w500,
          color: whiteColor),
    ),
  );
}
