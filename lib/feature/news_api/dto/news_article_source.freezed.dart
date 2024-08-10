// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_article_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsArticleSource _$NewsArticleSourceFromJson(Map<String, dynamic> json) {
  return _NewsArticleSource.fromJson(json);
}

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
      _$NewsArticleSourceCopyWithImpl<$Res, NewsArticleSource>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$NewsArticleSourceCopyWithImpl<$Res, $Val extends NewsArticleSource>
    implements $NewsArticleSourceCopyWith<$Res> {
  _$NewsArticleSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsArticleSourceImplCopyWith<$Res>
    implements $NewsArticleSourceCopyWith<$Res> {
  factory _$$NewsArticleSourceImplCopyWith(_$NewsArticleSourceImpl value,
          $Res Function(_$NewsArticleSourceImpl) then) =
      __$$NewsArticleSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$NewsArticleSourceImplCopyWithImpl<$Res>
    extends _$NewsArticleSourceCopyWithImpl<$Res, _$NewsArticleSourceImpl>
    implements _$$NewsArticleSourceImplCopyWith<$Res> {
  __$$NewsArticleSourceImplCopyWithImpl(_$NewsArticleSourceImpl _value,
      $Res Function(_$NewsArticleSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$NewsArticleSourceImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsArticleSourceImpl extends _NewsArticleSource {
  _$NewsArticleSourceImpl({this.id, this.name}) : super._();

  factory _$NewsArticleSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsArticleSourceImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'NewsArticleSource(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsArticleSourceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsArticleSourceImplCopyWith<_$NewsArticleSourceImpl> get copyWith =>
      __$$NewsArticleSourceImplCopyWithImpl<_$NewsArticleSourceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsArticleSourceImplToJson(
      this,
    );
  }
}

abstract class _NewsArticleSource extends NewsArticleSource {
  factory _NewsArticleSource({final String? id, final String? name}) =
      _$NewsArticleSourceImpl;
  _NewsArticleSource._() : super._();

  factory _NewsArticleSource.fromJson(Map<String, dynamic> json) =
      _$NewsArticleSourceImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$NewsArticleSourceImplCopyWith<_$NewsArticleSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
