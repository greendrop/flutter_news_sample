import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_news_sample/config/i18n/strings.g.dart';

export 'package:flutter_news_sample/config/i18n/strings.g.dart';

typedef UseTranslations = Translations Function();

Translations useTranslationsImpl() {
  return Translations.of(useContext());
}

final UseTranslations useTranslations = useTranslationsImpl;
