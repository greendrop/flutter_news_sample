class AppException implements Exception {
  AppException({this.parentException});

  dynamic parentException;

  String get message {
    return 'An error has occurred';
  }
}
