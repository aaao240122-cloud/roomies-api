// lib/ui/temas.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color indigo = Color(0xFF4F46E5);
  static const Color lavender = Color(0xFFA5B4FC);
  static const Color danger = Color(0xFFEF4444);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFFACC15);
  static const Color background = Color(0xFFF7F8FA);
  static const Color textDark = Color(0xFF111827);
}

class Temas {
  static const String fontTitle = 'Montserrat';
  static const String fontBody = 'OpenSans';

  static final ColorScheme _light = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lavender,
    onPrimary: Colors.white,
    secondary: AppColors.indigo,
    onSecondary: Colors.white,
    error: AppColors.danger,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: AppColors.textDark,
    background: AppColors.background,
    onBackground: AppColors.textDark,
  );

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _light,
        scaffoldBackgroundColor: _light.background,
        appBarTheme: AppBarTheme(
          backgroundColor: _light.primary,
          foregroundColor: _light.onPrimary,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: const TextStyle(
            fontFamily: fontTitle,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.indigo,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.lavender,
          selectedItemColor: AppColors.indigo,
          unselectedItemColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.indigo,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 14),
            textStyle: const TextStyle(fontFamily: fontTitle, fontWeight: FontWeight.w600),
          ),
        ),
        textTheme: Typography.blackMountainView.copyWith(
          titleLarge: const TextStyle(fontFamily: fontTitle, fontWeight: FontWeight.w700),
          titleMedium: const TextStyle(fontFamily: fontTitle, fontWeight: FontWeight.w600),
          bodyMedium: const TextStyle(fontFamily: fontBody),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.lavender.withOpacity(0.6)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.lavender.withOpacity(0.6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.indigo),
          ),
        ),
      );
}
