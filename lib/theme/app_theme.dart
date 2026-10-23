import 'package:flutter/material.dart';

/// Shared colours, spacing and theme of the app.
class AppTheme {
  const AppTheme._();

  /// Primary blue used for the app bar, selected tab and result value.
  static const Color primary = Color(0xFF2F6FED);

  /// Page background behind the converter card.
  static const Color scaffoldBackground = Color(0xFFF4F6FA);

  /// Border colour of inputs and dropdowns.
  static const Color border = Color(0xFFE2E7F0);

  /// Muted colour used for field labels.
  static const Color label = Color(0xFF8A94A6);

  /// Height of the text field and the dropdown fields.
  static const double fieldHeight = 52;

  /// Diameter of the round swap button.
  static const double swapButtonSize = 56;

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primary,
        selectionColor: Color(0x332F6FED),
        selectionHandleColor: primary,
      ),
    );
  }
}
