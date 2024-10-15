// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_log_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppLogFile _$AppLogFileFromJson(Map<String, dynamic> json) {
  return _AppLogFile.fromJson(json);
}

/// @nodoc
mixin _$AppLogFile {
  String get path => throw _privateConstructorUsedError;

  /// Serializes this AppLogFile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppLogFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppLogFileCopyWith<AppLogFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLogFileCopyWith<$Res> {
  factory $AppLogFileCopyWith(
          AppLogFile value, $Res Function(AppLogFile) then) =
      _$AppLogFileCopyWithImpl<$Res, AppLogFile>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class _$AppLogFileCopyWithImpl<$Res, $Val extends AppLogFile>
    implements $AppLogFileCopyWith<$Res> {
  _$AppLogFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppLogFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLogFileImplCopyWith<$Res>
    implements $AppLogFileCopyWith<$Res> {
  factory _$$AppLogFileImplCopyWith(
          _$AppLogFileImpl value, $Res Function(_$AppLogFileImpl) then) =
      __$$AppLogFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$AppLogFileImplCopyWithImpl<$Res>
    extends _$AppLogFileCopyWithImpl<$Res, _$AppLogFileImpl>
    implements _$$AppLogFileImplCopyWith<$Res> {
  __$$AppLogFileImplCopyWithImpl(
      _$AppLogFileImpl _value, $Res Function(_$AppLogFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppLogFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$AppLogFileImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppLogFileImpl extends _AppLogFile {
  _$AppLogFileImpl({this.path = ''}) : super._();

  factory _$AppLogFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppLogFileImplFromJson(json);

  @override
  @JsonKey()
  final String path;

  @override
  String toString() {
    return 'AppLogFile(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLogFileImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of AppLogFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLogFileImplCopyWith<_$AppLogFileImpl> get copyWith =>
      __$$AppLogFileImplCopyWithImpl<_$AppLogFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppLogFileImplToJson(
      this,
    );
  }
}

abstract class _AppLogFile extends AppLogFile {
  factory _AppLogFile({final String path}) = _$AppLogFileImpl;
  _AppLogFile._() : super._();

  factory _AppLogFile.fromJson(Map<String, dynamic> json) =
      _$AppLogFileImpl.fromJson;

  @override
  String get path;

  /// Create a copy of AppLogFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLogFileImplCopyWith<_$AppLogFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
