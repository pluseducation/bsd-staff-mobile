import 'package:flutter/material.dart';

class TextThemeColor {
  static TextTheme nullFontColor(TextTheme textTheme) {
    return textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    );
  }
}

TextTheme applyDefaultFontSize(TextTheme textTheme, double fontSize) {
  return textTheme.copyWith(
    displayLarge: textTheme.displayLarge?.copyWith(fontSize: fontSize),
    displayMedium: textTheme.displayMedium?.copyWith(fontSize: fontSize),
    displaySmall: textTheme.displaySmall?.copyWith(fontSize: fontSize),
    headlineLarge: textTheme.headlineLarge?.copyWith(fontSize: fontSize),
    headlineMedium: textTheme.headlineMedium?.copyWith(fontSize: fontSize),
    headlineSmall: textTheme.headlineSmall?.copyWith(fontSize: fontSize),
    titleLarge: textTheme.titleLarge?.copyWith(fontSize: fontSize),
    titleMedium: textTheme.titleMedium?.copyWith(fontSize: fontSize),
    titleSmall: textTheme.titleSmall?.copyWith(fontSize: fontSize),
    bodyLarge: textTheme.bodyLarge?.copyWith(fontSize: fontSize),
    bodyMedium: textTheme.bodyMedium?.copyWith(fontSize: fontSize),
    bodySmall: textTheme.bodySmall?.copyWith(fontSize: fontSize),
    labelLarge: textTheme.labelLarge?.copyWith(fontSize: fontSize),
    labelMedium: textTheme.labelMedium?.copyWith(fontSize: fontSize),
    labelSmall: textTheme.labelSmall?.copyWith(fontSize: fontSize),
  );
}
