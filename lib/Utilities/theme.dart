import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Map<String, Color> kLightThemeColors = {
  'primaryColor': const Color(0XFF251506),
};

final Map<String, Color> kDarkThemeColors = {
  'primaryColor': const Color(0xFFF9F4F4),
};

var kDarkThemeData = ThemeData().copyWith(
  textTheme: GoogleFonts.urbanistTextTheme(),
  colorScheme:
      ColorScheme.fromSeed(seedColor: kLightThemeColors['primaryColor']!),
);

var kLightThemeData = kDarkThemeData.copyWith(
  brightness: Brightness.dark,
  colorScheme:
      ColorScheme.fromSeed(seedColor: kDarkThemeColors['primaryColor']!),
);
