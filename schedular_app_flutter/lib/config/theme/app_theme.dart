import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedular_app_flutter/config/theme/theme_color.dart';

ThemeData appTheme() {
  final ColorScheme lightColorScheme = MaterialTheme.lightScheme();
  final baseTextTheme = GoogleFonts.lusitanaTextTheme();

  return ThemeData(
    useMaterial3: true,
    brightness: lightColorScheme.brightness,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: lightColorScheme.surfaceContainerLowest,
    textTheme: baseTextTheme.copyWith(
      headlineLarge: baseTextTheme.headlineLarge?.copyWith(
        color: lightColorScheme.primary,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        color: lightColorScheme.primary,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        color: lightColorScheme.primary,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: baseTextTheme.titleSmall?.copyWith(
        color: lightColorScheme.onTertiaryContainer,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        color: lightColorScheme.primary,
      ),
      bodySmall: baseTextTheme.bodySmall?.copyWith(
        color: lightColorScheme.onSurface,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.primary,
        textStyle: baseTextTheme.titleMedium,
        foregroundColor: lightColorScheme.onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fixedSize: Size(double.infinity, 50),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme().copyWith(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightColorScheme.primary),
        borderRadius: BorderRadius.circular(15),
      ),
      floatingLabelStyle: TextStyle(color: lightColorScheme.primary),
      labelStyle: TextStyle(color: lightColorScheme.outline),
      errorStyle: TextStyle(color: lightColorScheme.error),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightColorScheme.error),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
