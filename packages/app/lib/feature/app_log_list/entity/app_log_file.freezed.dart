// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_log_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppLogFile {

 String get path;
/// Create a copy of AppLogFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppLogFileCopyWith<AppLogFile> get copyWith => _$AppLogFileCopyWithImpl<AppLogFile>(this as AppLogFile, _$identity);

  /// Serializes this AppLogFile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLogFile&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'AppLogFile(path: $path)';
}


}

/// @nodoc
abstract mixin class $AppLogFileCopyWith<$Res>  {
  factory $AppLogFileCopyWith(AppLogFile value, $Res Function(AppLogFile) _then) = _$AppLogFileCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$AppLogFileCopyWithImpl<$Res>
    implements $AppLogFileCopyWith<$Res> {
  _$AppLogFileCopyWithImpl(this._self, this._then);

  final AppLogFile _self;
  final $Res Function(AppLogFile) _then;

/// Create a copy of AppLogFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AppLogFile extends AppLogFile {
   _AppLogFile({this.path = ''}): super._();
  factory _AppLogFile.fromJson(Map<String, dynamic> json) => _$AppLogFileFromJson(json);

@override@JsonKey() final  String path;

/// Create a copy of AppLogFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppLogFileCopyWith<_AppLogFile> get copyWith => __$AppLogFileCopyWithImpl<_AppLogFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppLogFileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppLogFile&&(identical(other.path, path) || other.path == path));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'AppLogFile(path: $path)';
}


}

/// @nodoc
abstract mixin class _$AppLogFileCopyWith<$Res> implements $AppLogFileCopyWith<$Res> {
  factory _$AppLogFileCopyWith(_AppLogFile value, $Res Function(_AppLogFile) _then) = __$AppLogFileCopyWithImpl;
@override @useResult
$Res call({
 String path
});




}
/// @nodoc
class __$AppLogFileCopyWithImpl<$Res>
    implements _$AppLogFileCopyWith<$Res> {
  __$AppLogFileCopyWithImpl(this._self, this._then);

  final _AppLogFile _self;
  final $Res Function(_AppLogFile) _then;

/// Create a copy of AppLogFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then(_AppLogFile(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
