import 'package:flutter/material.dart';

@immutable
class AdoptionColors {
  const AdoptionColors._();

  static const Color primary = Color(0xFF8B5E3C);
  static const Color primaryStrong = Color(0xFF6F452B);
  static const Color primarySoft = Color(0xFFF2E4D6);
  static const Color secondary = Color(0xFFC89A63);
  static const Color background = Color(0xFFF8F1E8);
  static const Color surface = Color(0xFFFFFCF8);
  static const Color surfaceSoft = Color(0xFFF5ECE2);
  static const Color surfaceMuted = Color(0xFFEFE2D4);
  static const Color border = Color(0xFFDAC8B8);
  static const Color borderSoft = Color(0xFFE7D9CC);
  static const Color textPrimary = Color(0xFF34261D);
  static const Color textSecondary = Color(0xFF6E584A);
  static const Color textMuted = Color(0xFF8F7A6C);
  static const Color textStrong = Color(0xFF453126);
  static const Color danger = Color(0xFFC86D4E);
  static const Color success = Color(0xFF9A6F49);
  static const Color successSoft = Color(0xFFF0E1D2);
  static const Color warning = Color(0xFFD39A58);
  static const Color chipBg = Color(0xFFF1E4D7);
  static const Color chipBorder = Color(0xFFD8C3B1);
  static const Color chipSelectedBg = Color(0xFF8B5E3C);
  static const Color chipSelectedBorder = Color(0xFF8B5E3C);
  static const Color chipSelectedText = Colors.white;
  static const Color chipText = Color(0xFF5F4B3E);
  static const Color badgeBg = Color(0xFFEEDCC9);
  static const Color badgeText = Color(0xFF6F452B);
  static const Color dragHandle = Color(0xFFCDB9A8);
  static const Color heroOverlayStrong = Color(0x73000000);
  static const Color heroOverlayLight = Color(0x1A000000);
  static const Color mapOverlay = Color(0x38FFFFFF);
  static const Color callBackground = Color(0xFFF0E2D5);
  static const Color iconMuted = Color(0xFFA58E7D);
}

@immutable
class AdoptionTheme extends ThemeExtension<AdoptionTheme> {
  const AdoptionTheme({
    required this.primary,
    required this.primaryStrong,
    required this.primarySoft,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.surfaceSoft,
    required this.surfaceMuted,
    required this.border,
    required this.borderSoft,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textStrong,
    required this.danger,
    required this.success,
    required this.successSoft,
    required this.warning,
    required this.chipBg,
    required this.chipBorder,
    required this.chipSelectedBg,
    required this.chipSelectedBorder,
    required this.chipSelectedText,
    required this.chipText,
    required this.badgeBg,
    required this.badgeText,
    required this.dragHandle,
    required this.heroOverlayStrong,
    required this.heroOverlayLight,
    required this.mapOverlay,
    required this.callBackground,
    required this.iconMuted,
  });

  const AdoptionTheme.light()
    : primary = AdoptionColors.primary,
      primaryStrong = AdoptionColors.primaryStrong,
      primarySoft = AdoptionColors.primarySoft,
      secondary = AdoptionColors.secondary,
      background = AdoptionColors.background,
      surface = AdoptionColors.surface,
      surfaceSoft = AdoptionColors.surfaceSoft,
      surfaceMuted = AdoptionColors.surfaceMuted,
      border = AdoptionColors.border,
      borderSoft = AdoptionColors.borderSoft,
      textPrimary = AdoptionColors.textPrimary,
      textSecondary = AdoptionColors.textSecondary,
      textMuted = AdoptionColors.textMuted,
      textStrong = AdoptionColors.textStrong,
      danger = AdoptionColors.danger,
      success = AdoptionColors.success,
      successSoft = AdoptionColors.successSoft,
      warning = AdoptionColors.warning,
      chipBg = AdoptionColors.chipBg,
      chipBorder = AdoptionColors.chipBorder,
      chipSelectedBg = AdoptionColors.chipSelectedBg,
      chipSelectedBorder = AdoptionColors.chipSelectedBorder,
      chipSelectedText = AdoptionColors.chipSelectedText,
      chipText = AdoptionColors.chipText,
      badgeBg = AdoptionColors.badgeBg,
      badgeText = AdoptionColors.badgeText,
      dragHandle = AdoptionColors.dragHandle,
      heroOverlayStrong = AdoptionColors.heroOverlayStrong,
      heroOverlayLight = AdoptionColors.heroOverlayLight,
      mapOverlay = AdoptionColors.mapOverlay,
      callBackground = AdoptionColors.callBackground,
      iconMuted = AdoptionColors.iconMuted;

  final Color primary;
  final Color primaryStrong;
  final Color primarySoft;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color surfaceSoft;
  final Color surfaceMuted;
  final Color border;
  final Color borderSoft;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textStrong;
  final Color danger;
  final Color success;
  final Color successSoft;
  final Color warning;
  final Color chipBg;
  final Color chipBorder;
  final Color chipSelectedBg;
  final Color chipSelectedBorder;
  final Color chipSelectedText;
  final Color chipText;
  final Color badgeBg;
  final Color badgeText;
  final Color dragHandle;
  final Color heroOverlayStrong;
  final Color heroOverlayLight;
  final Color mapOverlay;
  final Color callBackground;
  final Color iconMuted;

  @override
  AdoptionTheme copyWith({
    Color? primary,
    Color? primaryStrong,
    Color? primarySoft,
    Color? secondary,
    Color? background,
    Color? surface,
    Color? surfaceSoft,
    Color? surfaceMuted,
    Color? border,
    Color? borderSoft,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? textStrong,
    Color? danger,
    Color? success,
    Color? successSoft,
    Color? warning,
    Color? chipBg,
    Color? chipBorder,
    Color? chipSelectedBg,
    Color? chipSelectedBorder,
    Color? chipSelectedText,
    Color? chipText,
    Color? badgeBg,
    Color? badgeText,
    Color? dragHandle,
    Color? heroOverlayStrong,
    Color? heroOverlayLight,
    Color? mapOverlay,
    Color? callBackground,
    Color? iconMuted,
  }) {
    return AdoptionTheme(
      primary: primary ?? this.primary,
      primaryStrong: primaryStrong ?? this.primaryStrong,
      primarySoft: primarySoft ?? this.primarySoft,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceSoft: surfaceSoft ?? this.surfaceSoft,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      border: border ?? this.border,
      borderSoft: borderSoft ?? this.borderSoft,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      textStrong: textStrong ?? this.textStrong,
      danger: danger ?? this.danger,
      success: success ?? this.success,
      successSoft: successSoft ?? this.successSoft,
      warning: warning ?? this.warning,
      chipBg: chipBg ?? this.chipBg,
      chipBorder: chipBorder ?? this.chipBorder,
      chipSelectedBg: chipSelectedBg ?? this.chipSelectedBg,
      chipSelectedBorder: chipSelectedBorder ?? this.chipSelectedBorder,
      chipSelectedText: chipSelectedText ?? this.chipSelectedText,
      chipText: chipText ?? this.chipText,
      badgeBg: badgeBg ?? this.badgeBg,
      badgeText: badgeText ?? this.badgeText,
      dragHandle: dragHandle ?? this.dragHandle,
      heroOverlayStrong: heroOverlayStrong ?? this.heroOverlayStrong,
      heroOverlayLight: heroOverlayLight ?? this.heroOverlayLight,
      mapOverlay: mapOverlay ?? this.mapOverlay,
      callBackground: callBackground ?? this.callBackground,
      iconMuted: iconMuted ?? this.iconMuted,
    );
  }

  @override
  AdoptionTheme lerp(covariant ThemeExtension<AdoptionTheme>? other, double t) {
    if (other is! AdoptionTheme) {
      return this;
    }

    Color lerpColor(Color a, Color b) => Color.lerp(a, b, t)!;

    return AdoptionTheme(
      primary: lerpColor(primary, other.primary),
      primaryStrong: lerpColor(primaryStrong, other.primaryStrong),
      primarySoft: lerpColor(primarySoft, other.primarySoft),
      secondary: lerpColor(secondary, other.secondary),
      background: lerpColor(background, other.background),
      surface: lerpColor(surface, other.surface),
      surfaceSoft: lerpColor(surfaceSoft, other.surfaceSoft),
      surfaceMuted: lerpColor(surfaceMuted, other.surfaceMuted),
      border: lerpColor(border, other.border),
      borderSoft: lerpColor(borderSoft, other.borderSoft),
      textPrimary: lerpColor(textPrimary, other.textPrimary),
      textSecondary: lerpColor(textSecondary, other.textSecondary),
      textMuted: lerpColor(textMuted, other.textMuted),
      textStrong: lerpColor(textStrong, other.textStrong),
      danger: lerpColor(danger, other.danger),
      success: lerpColor(success, other.success),
      successSoft: lerpColor(successSoft, other.successSoft),
      warning: lerpColor(warning, other.warning),
      chipBg: lerpColor(chipBg, other.chipBg),
      chipBorder: lerpColor(chipBorder, other.chipBorder),
      chipSelectedBg: lerpColor(chipSelectedBg, other.chipSelectedBg),
      chipSelectedBorder: lerpColor(
        chipSelectedBorder,
        other.chipSelectedBorder,
      ),
      chipSelectedText: lerpColor(chipSelectedText, other.chipSelectedText),
      chipText: lerpColor(chipText, other.chipText),
      badgeBg: lerpColor(badgeBg, other.badgeBg),
      badgeText: lerpColor(badgeText, other.badgeText),
      dragHandle: lerpColor(dragHandle, other.dragHandle),
      heroOverlayStrong: lerpColor(heroOverlayStrong, other.heroOverlayStrong),
      heroOverlayLight: lerpColor(heroOverlayLight, other.heroOverlayLight),
      mapOverlay: lerpColor(mapOverlay, other.mapOverlay),
      callBackground: lerpColor(callBackground, other.callBackground),
      iconMuted: lerpColor(iconMuted, other.iconMuted),
    );
  }
}

extension AdoptionThemeContext on BuildContext {
  AdoptionTheme get adoptionTheme =>
      Theme.of(this).extension<AdoptionTheme>() ?? const AdoptionTheme.light();
}
