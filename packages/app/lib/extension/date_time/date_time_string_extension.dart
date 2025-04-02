extension DateTimeStringExtension on DateTime {
  String get timeZoneOffsetString {
    // NOTE: https://github.com/dart-lang/sdk/issues/43391

    final offset = timeZoneOffset;
    final hour = offset.inHours.abs();
    final minute = offset.inMinutes - offset.inHours * 60;
    return '${offset.isNegative ? '-' : '+'}'
        '${hour.toString().padLeft(2, '0')}:'
        '${minute.toString().padLeft(2, '0')}';
  }

  String get toIso8601StringWithTimeZoneOffsetString {
    if (isUtc) {
      return toIso8601String();
    }

    return '${toIso8601String()}$timeZoneOffsetString';
  }
}
