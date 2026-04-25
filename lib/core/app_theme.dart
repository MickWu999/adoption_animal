import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF4F8A3F);
  static const Color secondary = Color(0xFFF2C14E);
  static const Color background = Color(0xFFF8F4ED);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      fontFamily: 'PingFang TC',
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        surface: Colors.white,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: Color(0xFFE7F3E2),
        backgroundColor: Colors.white,
        height: 74,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
