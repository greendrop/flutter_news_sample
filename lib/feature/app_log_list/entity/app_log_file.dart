import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_log_file.freezed.dart';
part 'app_log_file.g.dart';

@freezed
class AppLogFile with _$AppLogFile {
  factory AppLogFile({
    @Default('') String path,
  }) = _AppLogFile;
  const AppLogFile._();

  factory AppLogFile.fromJson(Map<String, dynamic> json) =>
      _$AppLogFileFromJson(json);
}
