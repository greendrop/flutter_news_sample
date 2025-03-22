import 'package:app/config/design_token/color.dart';
import 'package:app/config/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  factory AppThemeData() => instance;
  AppThemeData._internal();

  static final AppThemeData instance = AppThemeData._internal();

  ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: DesignTokenColor.light.primary,
        onPrimary: DesignTokenColor.light.onPrimary,
        secondary: DesignTokenColor.light.secondary,
        onSecondary: DesignTokenColor.light.onSecondary,
        error: DesignTokenColor.light.error,
        onError: DesignTokenColor.light.onError,
        surface: DesignTokenColor.light.surface,
        onSurface: DesignTokenColor.light.onSurface,
      ),
      fontFamily: FontFamily.inter,
      fontFamilyFallback: const [FontFamily.notoSansJP, 'Roboto'],
    );
  }

  ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: DesignTokenColor.dark.primary,
        onPrimary: DesignTokenColor.dark.onPrimary,
        secondary: DesignTokenColor.dark.secondary,
        onSecondary: DesignTokenColor.dark.onSecondary,
        error: DesignTokenColor.dark.error,
        onError: DesignTokenColor.dark.onError,
        surface: DesignTokenColor.dark.surface,
        onSurface: DesignTokenColor.dark.onSurface,
      ),
      fontFamily: FontFamily.inter,
      fontFamilyFallback: const [FontFamily.notoSansJP, 'Roboto'],
    );
  }
}
