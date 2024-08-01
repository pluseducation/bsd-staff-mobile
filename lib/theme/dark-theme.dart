import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/text-theme-color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextThemeColor.nullFontColor(GoogleFonts.notoSansThaiTextTheme()),
  primaryTextTheme:
      TextThemeColor.nullFontColor(GoogleFonts.notoSansThaiTextTheme()),
  appBarTheme: const AppBarTheme(
    backgroundColor: MainColors.primary700,
  ),
  colorScheme: const ColorScheme.dark(
    primary: MainColors.primary500,
    secondary: MainColors.secondary,
    outline: MainColors.primary700,
    surface: MainColors.primary900,
  ),
);
