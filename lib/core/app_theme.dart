import 'package:flutter/material.dart';

import 'theme/adoption_theme.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AdoptionColors.background,
      fontFamily: 'PingFang TC',
      colorScheme: ColorScheme.fromSeed(
        seedColor: AdoptionColors.primary,
        primary: AdoptionColors.primary,
        secondary: AdoptionColors.secondary,
        surface: AdoptionColors.surface,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: AdoptionColors.primarySoft,
        backgroundColor: AdoptionColors.surface,
        height: 74,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      cardColor: AdoptionColors.surface,
      dividerColor: AdoptionColors.borderSoft,
      chipTheme: ChipThemeData(
        backgroundColor: AdoptionColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      extensions: const [AdoptionTheme.light()],
    );
  }
}
