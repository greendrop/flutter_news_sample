import 'package:flutter_news_sample/feature/localization/hook/use_l10n.dart';

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

  String messageByL10n(L10n l10n) {
    return l10n.appExceptionMessage;
  }
}
