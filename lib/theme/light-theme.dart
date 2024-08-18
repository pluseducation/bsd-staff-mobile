import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/util/text-theme-color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: MainColors.background,
  primaryTextTheme:
      TextThemeColor.nullFontColor(GoogleFonts.notoSansThaiTextTheme()),
  textTheme: TextThemeColor.nullFontColor(GoogleFonts.notoSansThaiTextTheme()),
  appBarTheme: const AppBarTheme(
    backgroundColor: MainColors.primary700,
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: const BorderSide(color: Color(0xFFf1f1f1)),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shadowColor: Colors.grey.withOpacity(0.1),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: MainColors.primary500,
      ),
    ),
    labelStyle: const TextStyle(color: MainColors.text),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: MainColors.white,
      backgroundColor: MainColors.primary500,
      padding: const EdgeInsets.all(14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: MainColors.primary500),
      padding: const EdgeInsets.all(14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: MainColors.primary500,
    secondary: MainColors.secondary,
    outline: Colors.grey[300],
    surface: Colors.grey[100]!,
  ),
);
