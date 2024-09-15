import 'package:flutter/material.dart';

class DesignTokenColor {
  DesignTokenColor({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.surface,
    required this.onSurface,
    required this.infoText,
    required this.infoBackground,
    required this.warningText,
    required this.warningBackground,
    required this.dangerText,
    required this.dangerBackground,
  });

  factory DesignTokenColor.fromBrightness(Brightness brightness) {
    late DesignTokenBaseColor designTokenBaseColor;
    if (brightness == Brightness.light) {
      designTokenBaseColor = DesignTokenLightColor.instance;
    } else {
      designTokenBaseColor = DesignTokenDarkColor.instance;
    }

    return DesignTokenColor(
      primary: designTokenBaseColor.primary,
      onPrimary: designTokenBaseColor.onPrimary,
      secondary: designTokenBaseColor.secondary,
      onSecondary: designTokenBaseColor.onSecondary,
      error: designTokenBaseColor.error,
      onError: designTokenBaseColor.onError,
      surface: designTokenBaseColor.surface,
      onSurface: designTokenBaseColor.onSurface,
      infoText: designTokenBaseColor.infoText,
      infoBackground: designTokenBaseColor.infoBackground,
      warningText: designTokenBaseColor.warningText,
      warningBackground: designTokenBaseColor.warningBackground,
      dangerText: designTokenBaseColor.dangerText,
      dangerBackground: designTokenBaseColor.dangerBackground,
    );
  }

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color surface;
  final Color onSurface;
  final Color infoText;
  final Color infoBackground;
  final Color warningText;
  final Color warningBackground;
  final Color dangerText;
  final Color dangerBackground;

  static final DesignTokenColor light =
      DesignTokenColor.fromBrightness(Brightness.light);

  static final DesignTokenColor dark =
      DesignTokenColor.fromBrightness(Brightness.dark);
}

abstract class DesignTokenBaseColor {
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get onSecondary;
  Color get error;
  Color get onError;
  Color get surface;
  Color get onSurface;
  Color get infoText => const Color.fromARGB(255, 12, 84, 96);
  Color get infoBackground => const Color.fromARGB(255, 209, 236, 241);
  Color get warningText => const Color.fromARGB(255, 133, 100, 4);
  Color get warningBackground => const Color.fromARGB(255, 255, 243, 205);
  Color get dangerText => const Color.fromARGB(255, 114, 28, 36);
  Color get dangerBackground => const Color.fromARGB(255, 248, 215, 218);
}

class DesignTokenLightColor extends DesignTokenBaseColor {
  factory DesignTokenLightColor() => instance;
  DesignTokenLightColor._internal();

  static final DesignTokenLightColor instance =
      DesignTokenLightColor._internal();

  @override
  Color get primary => const Color.fromARGB(255, 54, 97, 142);
  @override
  Color get onPrimary => const Color.fromARGB(255, 255, 255, 255);
  @override
  Color get secondary => const Color.fromARGB(255, 83, 95, 112);
  @override
  Color get onSecondary => const Color.fromARGB(255, 255, 255, 255);
  @override
  Color get error => const Color.fromARGB(255, 186, 26, 26);
  @override
  Color get onError => const Color.fromARGB(255, 255, 255, 255);
  @override
  Color get surface => const Color.fromARGB(255, 248, 249, 255);
  @override
  Color get onSurface => const Color.fromARGB(255, 25, 28, 32);
}

class DesignTokenDarkColor extends DesignTokenBaseColor {
  factory DesignTokenDarkColor() => instance;
  DesignTokenDarkColor._internal();

  static final DesignTokenDarkColor instance = DesignTokenDarkColor._internal();

  @override
  Color get primary => const Color.fromARGB(255, 160, 202, 253);
  @override
  Color get onPrimary => const Color.fromARGB(255, 0, 50, 88);
  @override
  Color get secondary => const Color.fromARGB(255, 187, 199, 219);
  @override
  Color get onSecondary => const Color.fromARGB(255, 37, 49, 64);
  @override
  Color get error => const Color.fromARGB(255, 255, 180, 171);
  @override
  Color get onError => const Color.fromARGB(255, 105, 0, 5);
  @override
  Color get surface => const Color.fromARGB(255, 17, 20, 24);
  @override
  Color get onSurface => const Color.fromARGB(255, 225, 226, 232);
}
