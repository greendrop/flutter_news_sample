import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/i18n/strings.g.dart';

Locale useTranslationLocale() {
  return TranslationProvider.of(useContext()).flutterLocale;
}
