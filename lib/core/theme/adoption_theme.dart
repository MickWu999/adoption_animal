// import 'package:flutter/material.dart';

// @immutable
// class AdoptionTheme extends ThemeExtension<AdoptionTheme> {
//   const AdoptionTheme({
//     required this.primary,
//     required this.secondary,
//     required this.background,
//     required this.surface,
//     required this.favorite,
//     required this.success,
//     required this.successStrong,
//     required this.warning,
//     required this.mutedText,
//     required this.strongText,
//     required this.chipBackground,
//     required this.chipBorder,
//     required this.divider,
//     required this.navigationIndicator,
//     required this.filterSheetBackground,
//     required this.dragHandle,
//     required this.heroOverlayStrong,
//     required this.heroOverlayLight,
//     required this.mapOverlay,
//     required this.callBackground,
//   });

//   const AdoptionTheme.light()
//     : primary = const Color(0xFF4F8A3F),
//       secondary = const Color(0xFFF2C14E),
//       background = const Color(0xFFF8F4ED),
//       surface = Colors.white,
//       favorite = const Color(0xFFE35D4F),
//       success = const Color(0xFF5E9B54),
//       successStrong = const Color(0xFF4F8A3F),
//       warning = const Color(0xFFF29D38),
//       mutedText = Colors.black54,
//       strongText = const Color(0xFF2C2C2C),
//       chipBackground = const Color(0xFFF4F0EA),
//       chipBorder = const Color(0xFFE7E0D6),
//       divider = const Color(0xFFD9D3C8),
//       navigationIndicator = const Color(0xFFE7F3E2),
//       filterSheetBackground = const Color(0xFFF7F4EE),
//       dragHandle = const Color(0xFFD4CEC4),
//       heroOverlayStrong = const Color(0x73000000),
//       heroOverlayLight = const Color(0x1A000000),
//       mapOverlay = const Color(0x38FFFFFF),
//       callBackground = const Color(0xFFE8F3E4);

//   final Color primary;
//   final Color secondary;
//   final Color background;
//   final Color surface;
//   final Color favorite;
//   final Color success;
//   final Color successStrong;
//   final Color warning;
//   final Color mutedText;
//   final Color strongText;
//   final Color chipBackground;
//   final Color chipBorder;
//   final Color divider;
//   final Color navigationIndicator;
//   final Color filterSheetBackground;
//   final Color dragHandle;
//   final Color heroOverlayStrong;
//   final Color heroOverlayLight;
//   final Color mapOverlay;
//   final Color callBackground;

//   @override
//   ThemeExtension<AdoptionTheme> copyWith({
//     Color? primary,
//     Color? secondary,
//     Color? background,
//     Color? surface,
//     Color? favorite,
//     Color? success,
//     Color? successStrong,
//     Color? warning,
//     Color? mutedText,
//     Color? strongText,
//     Color? chipBackground,
//     Color? chipBorder,
//     Color? divider,
//     Color? navigationIndicator,
//     Color? filterSheetBackground,
//     Color? dragHandle,
//     Color? heroOverlayStrong,
//     Color? heroOverlayLight,
//     Color? mapOverlay,
//     Color? callBackground,
//   }) {
//     return AdoptionTheme(
//       primary: primary ?? this.primary,
//       secondary: secondary ?? this.secondary,
//       background: background ?? this.background,
//       surface: surface ?? this.surface,
//       favorite: favorite ?? this.favorite,
//       success: success ?? this.success,
//       successStrong: successStrong ?? this.successStrong,
//       warning: warning ?? this.warning,
//       mutedText: mutedText ?? this.mutedText,
//       strongText: strongText ?? this.strongText,
//       chipBackground: chipBackground ?? this.chipBackground,
//       chipBorder: chipBorder ?? this.chipBorder,
//       divider: divider ?? this.divider,
//       navigationIndicator: navigationIndicator ?? this.navigationIndicator,
//       filterSheetBackground:
//           filterSheetBackground ?? this.filterSheetBackground,
//       dragHandle: dragHandle ?? this.dragHandle,
//       heroOverlayStrong: heroOverlayStrong ?? this.heroOverlayStrong,
//       heroOverlayLight: heroOverlayLight ?? this.heroOverlayLight,
//       mapOverlay: mapOverlay ?? this.mapOverlay,
//       callBackground: callBackground ?? this.callBackground,
//     );
//   }

//   @override
//   ThemeExtension<AdoptionTheme> lerp(
//     covariant ThemeExtension<AdoptionTheme>? other,
//     double t,
//   ) {
//     if (other is! AdoptionTheme) {
//       return this;
//     }

//     return AdoptionTheme(
//       primary: Color.lerp(primary, other.primary, t)!,
//       secondary: Color.lerp(secondary, other.secondary, t)!,
//       background: Color.lerp(background, other.background, t)!,
//       surface: Color.lerp(surface, other.surface, t)!,
//       favorite: Color.lerp(favorite, other.favorite, t)!,
//       success: Color.lerp(success, other.success, t)!,
//       successStrong: Color.lerp(successStrong, other.successStrong, t)!,
//       warning: Color.lerp(warning, other.warning, t)!,
//       mutedText: Color.lerp(mutedText, other.mutedText, t)!,
//       strongText: Color.lerp(strongText, other.strongText, t)!,
//       chipBackground: Color.lerp(chipBackground, other.chipBackground, t)!,
//       chipBorder: Color.lerp(chipBorder, other.chipBorder, t)!,
//       divider: Color.lerp(divider, other.divider, t)!,
//       navigationIndicator: Color.lerp(
//         navigationIndicator,
//         other.navigationIndicator,
//         t,
//       )!,
//       filterSheetBackground: Color.lerp(
//         filterSheetBackground,
//         other.filterSheetBackground,
//         t,
//       )!,
//       dragHandle: Color.lerp(dragHandle, other.dragHandle, t)!,
//       heroOverlayStrong: Color.lerp(
//         heroOverlayStrong,
//         other.heroOverlayStrong,
//         t,
//       )!,
//       heroOverlayLight: Color.lerp(
//         heroOverlayLight,
//         other.heroOverlayLight,
//         t,
//       )!,
//       mapOverlay: Color.lerp(mapOverlay, other.mapOverlay, t)!,
//       callBackground: Color.lerp(callBackground, other.callBackground, t)!,
//     );
//   }
// }

// extension AdoptionThemeContext on BuildContext {
//   AdoptionTheme get adoptionTheme =>
//       Theme.of(this).extension<AdoptionTheme>() ?? const AdoptionTheme.light();
// }
