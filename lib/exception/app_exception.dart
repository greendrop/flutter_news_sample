import 'package:flutter_news_sample/config/i18n/strings.g.dart';

class AppException implements Exception {
  AppException({this.parentException});
  factory AppException.fromException(Exception? exception) {
    if (exception is AppException) {
      return exception;
    }

    return AppException(parentException: exception);
  }

  Exception? parentException;

  String get message {
    return 'An error has occurred.';
  }

  String messageByTranslations(Translations translations) {
    return translations.appException.message;
  }
}
