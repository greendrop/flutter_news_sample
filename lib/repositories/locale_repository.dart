// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepository {
  static const _localeKey = 'locale';

  Future<Locale?> fetch() async {
    final prefs = await SharedPreferences.getInstance();
    final localeValue = prefs.getString(_localeKey);
    if (localeValue == null || localeValue.isEmpty) {
      return null;
    }

    return Locale(localeValue);
  }

  Future<void> update(Locale? locale) async {
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.setString(_localeKey, '');
    } else {
      await prefs.setString(_localeKey, locale.languageCode);
    }
  }
}
