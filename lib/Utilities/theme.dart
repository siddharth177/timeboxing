import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Map<String, Color> kDarkThemeColors = {
  'darkBrownColor': const Color(0xFF251506),
  'whiteBrownColor': const Color(0xFFF9F4F4),
  'lightGreenColor': const Color(0xFF9BB068),
  'darkGreenColor': const Color(0xFF3C4925),
  'lightOrangeColor': const Color(0xFFEF8833),
  'lightBrownColor': const Color(0xFF4F3422),
  'lightPurpleColor': const Color(0xFFA687FF),
  'darkPurpleColor': const Color(0xFF865BF0),
  'lightPinkColor': const Color(0xFFFB7285),
  'darkPinkColor': const Color(0xFFF4405E),
  'greyColor': const Color(0xFF756C65),
};

final Map<String, Color> kLightThemeColors = {
  'whiteBrownColor': kDarkThemeColors['whiteBrownColor']!,
  'lightGreenColor': kDarkThemeColors['lightGreenColor']!,
  'lightOrangeColor': kDarkThemeColors['lightOrangeColor']!,
  'lightBrownColor': kDarkThemeColors['lightBrownColor']!,
  'lightPurpleColor': kDarkThemeColors['lightPurpleColor']!,
  'lightPinkColor': kDarkThemeColors['lightPinkColor']!,
  'greyColor': kDarkThemeColors['greyColor']!,
};

var kDarkThemeData = ThemeData().copyWith(
  textTheme: GoogleFonts.urbanistTextTheme(),
  colorScheme:
      ColorScheme.fromSeed(seedColor: kDarkThemeColors['darkBrownColor']!),
);

var kLightThemeData = kDarkThemeData.copyWith(
  brightness: Brightness.dark,
  colorScheme:
      ColorScheme.fromSeed(seedColor: kLightThemeColors['whiteBrownColor']!),
);
