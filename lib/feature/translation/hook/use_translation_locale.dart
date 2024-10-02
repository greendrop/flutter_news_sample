import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/i18n/strings.g.dart';

typedef UseTranslationLocale = Locale Function();

Locale useTranslationLocaleImpl() {
  return TranslationProvider.of(useContext()).flutterLocale;
}

final UseTranslationLocale useTranslationLocale = useTranslationLocaleImpl;
