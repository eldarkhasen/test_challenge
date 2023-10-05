import 'package:flutter/material.dart';

import 'constants.dart';

//Light Input Decoration
InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    enabledBorder: enabledLightBorder,
    errorBorder: errorBorder,
    border: defaultLightBorder,
    focusedBorder:focusedBorder ,
    contentPadding: const EdgeInsets.all(16),
    hintStyle: const TextStyle(
        fontWeight: FontWeight.w400, color: secondaryTextColor, fontSize: 16));

OutlineInputBorder enabledLightBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(24)),
  borderSide: BorderSide(
    color: lightInputColor,
  ),
);

OutlineInputBorder errorBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(24)),
  borderSide: BorderSide(
    color: errorColor,
  ),
);
OutlineInputBorder defaultLightBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(24)),
  borderSide: BorderSide(
    color: lightInputColor,
  ),
);

//Dark Input Decoration
InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  enabledBorder: enabledDarkBorder,
  errorBorder: errorBorder,
  border: defaultDarkBorder,
  focusedBorder: focusedBorder,
  contentPadding: const EdgeInsets.all(16),
  hintStyle: const TextStyle(
      fontWeight: FontWeight.w400, color: whiteColor, fontSize: 16),
);

OutlineInputBorder enabledDarkBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(24)),
  borderSide: BorderSide(
    color: darkInputColor,
  ),
);


OutlineInputBorder focusedBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(24)),
  borderSide: BorderSide(
    color: primaryColor,
  ),
);
OutlineInputBorder defaultDarkBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(24)),
  borderSide: BorderSide(
    color: darkInputColor,
  ),
);
