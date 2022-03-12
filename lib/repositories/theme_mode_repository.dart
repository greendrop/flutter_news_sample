// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeRepository {
  static const _themeModeKey = 'themeMode';
  Future<ThemeMode> fetch() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeValue = prefs.getString(_themeModeKey);
    final themeMode = ThemeMode.values.firstWhere(
      (element) => element.toString() == themeModeValue,
      orElse: () => ThemeMode.system,
    );

    return themeMode;
  }

  Future<void> update(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeModeKey, themeMode.toString());
  }
}
