import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Map<String, Color> kLightThemeColors = {
  'primaryColor': const Color(0xFFFFFFFF),
};

final Map<String, Color> kDarkThemeColors = {
  'primaryColor': const Color(0xFFFFFFFF),
};

var kDarkThemeData = ThemeData().copyWith(
  textTheme: GoogleFonts.urbanistTextTheme(),
  colorScheme:
      ColorScheme.fromSeed(seedColor: kLightThemeColors['primaryColor']!),
);

var kLightThemeData = kDarkThemeData.copyWith(
    colorScheme:
        ColorScheme.fromSeed(seedColor: kDarkThemeColors['primaryColor']!)
);
