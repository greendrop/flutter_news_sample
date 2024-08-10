import 'package:flutter_news_sample/config/i18n/strings.g.dart';

class AppException implements Exception {
  AppException({this.parentException});

  Exception? parentException;

  String get message {
    return 'An error has occurred.';
  }

  String messageByTranslations(Translations translations) {
    return translations.appException.message;
  }
}
