// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_article_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsArticleSource _$NewsArticleSourceFromJson(Map<String, dynamic> json) {
  return _NewsArticleSource.fromJson(json);
}

/// @nodoc
class _$NewsArticleSourceTearOff {
  const _$NewsArticleSourceTearOff();

  _NewsArticleSource call({String? id, String? name}) {
    return _NewsArticleSource(
      id: id,
      name: name,
    );
  }

  NewsArticleSource fromJson(Map<String, Object?> json) {
    return NewsArticleSource.fromJson(json);
  }
}

/// @nodoc
const $NewsArticleSource = _$NewsArticleSourceTearOff();

/// @nodoc
mixin _$NewsArticleSource {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsArticleSourceCopyWith<NewsArticleSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsArticleSourceCopyWith<$Res> {
  factory $NewsArticleSourceCopyWith(
          NewsArticleSource value, $Res Function(NewsArticleSource) then) =
      _$NewsArticleSourceCopyWithImpl<$Res>;
  $Res call({String? id, String? name});
}

/// @nodoc
class _$NewsArticleSourceCopyWithImpl<$Res>
    implements $NewsArticleSourceCopyWith<$Res> {
  _$NewsArticleSourceCopyWithImpl(this._value, this._then);

  final NewsArticleSource _value;
  // ignore: unused_field
  final $Res Function(NewsArticleSource) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NewsArticleSourceCopyWith<$Res>
    implements $NewsArticleSourceCopyWith<$Res> {
  factory _$NewsArticleSourceCopyWith(
          _NewsArticleSource value, $Res Function(_NewsArticleSource) then) =
      __$NewsArticleSourceCopyWithImpl<$Res>;
  @override
  $Res call({String? id, String? name});
}

/// @nodoc
class __$NewsArticleSourceCopyWithImpl<$Res>
    extends _$NewsArticleSourceCopyWithImpl<$Res>
    implements _$NewsArticleSourceCopyWith<$Res> {
  __$NewsArticleSourceCopyWithImpl(
      _NewsArticleSource _value, $Res Function(_NewsArticleSource) _then)
      : super(_value, (v) => _then(v as _NewsArticleSource));

  @override
  _NewsArticleSource get _value => super._value as _NewsArticleSource;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_NewsArticleSource(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsArticleSource extends _NewsArticleSource {
  _$_NewsArticleSource({this.id, this.name}) : super._();

  factory _$_NewsArticleSource.fromJson(Map<String, dynamic> json) =>
      _$$_NewsArticleSourceFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'NewsArticleSource(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsArticleSource &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$NewsArticleSourceCopyWith<_NewsArticleSource> get copyWith =>
      __$NewsArticleSourceCopyWithImpl<_NewsArticleSource>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsArticleSourceToJson(this);
  }
}

abstract class _NewsArticleSource extends NewsArticleSource {
  factory _NewsArticleSource({String? id, String? name}) = _$_NewsArticleSource;
  _NewsArticleSource._() : super._();

  factory _NewsArticleSource.fromJson(Map<String, dynamic> json) =
      _$_NewsArticleSource.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$NewsArticleSourceCopyWith<_NewsArticleSource> get copyWith =>
      throw _privateConstructorUsedError;
}
