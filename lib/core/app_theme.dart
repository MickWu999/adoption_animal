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
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AdoptionColors.surfaceSoft,
        backgroundColor: AdoptionColors.surface,
        height: 74,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            color: selected
                ? AdoptionColors.primaryStrong
                : AdoptionColors.textMuted,
            fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected
                ? AdoptionColors.primaryStrong
                : AdoptionColors.textMuted,
          );
        }),
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
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AdoptionColors.primaryStrong,
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      extensions: const [AdoptionTheme.light()],
    );
  }
}
