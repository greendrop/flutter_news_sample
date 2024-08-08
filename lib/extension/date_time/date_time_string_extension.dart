extension DateTimeStringExtension on DateTime {
  String get timeZoneOffsetString {
    // NOTE: https://github.com/dart-lang/sdk/issues/43391

    final offset = timeZoneOffset;
    // ignore: prefer_interpolation_to_compose_strings
    return (offset.isNegative ? '-' : '+') +
        offset.inHours.abs().toString().padLeft(2, '0') +
        ':' +
        (offset.inMinutes - offset.inHours * 60).toString().padLeft(2, '0');
  }

  String get toIso8601StringWithTimeZoneOffsetString {
    if (isUtc) {
      return toIso8601String();
    }

    return '${toIso8601String()}$timeZoneOffsetString';
  }
}
