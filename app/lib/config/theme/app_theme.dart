import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFE86B32); // Vibrant Orange
  static const Color secondaryColor = Color(0xFF2D3436); // Dark Charcoal
  static const Color accentColor = Color(0xFF6B5B95); // Royal Purple
  static const Color inputBackground = Color(0xFFF8F9FA); // Off-White
  static const Color iconColor = Color(0xFFE86B32);

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Outfit', // Assuming they might add it, or default to system
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 32, 
        fontWeight: FontWeight.w800, 
        color: secondaryColor,
        letterSpacing: -0.5,
      ),
      titleLarge: TextStyle(
        fontSize: 24, 
        fontWeight: FontWeight.bold, 
        color: secondaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16, 
        color: Colors.black54,
        height: 1.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: primaryColor, width: 1.5),
      ),
    ),
  );
}