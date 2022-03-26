// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsSearchResponse _$NewsSearchResponseFromJson(Map<String, dynamic> json) {
  return _NewsSearchResponse.fromJson(json);
}

/// @nodoc
class _$NewsSearchResponseTearOff {
  const _$NewsSearchResponseTearOff();

  _NewsSearchResponse call(
      {String? status, int? totalResults, List<NewsArticle>? articles}) {
    return _NewsSearchResponse(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }

  NewsSearchResponse fromJson(Map<String, Object?> json) {
    return NewsSearchResponse.fromJson(json);
  }
}

/// @nodoc
const $NewsSearchResponse = _$NewsSearchResponseTearOff();

/// @nodoc
mixin _$NewsSearchResponse {
  String? get status => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  List<NewsArticle>? get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsSearchResponseCopyWith<NewsSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsSearchResponseCopyWith<$Res> {
  factory $NewsSearchResponseCopyWith(
          NewsSearchResponse value, $Res Function(NewsSearchResponse) then) =
      _$NewsSearchResponseCopyWithImpl<$Res>;
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class _$NewsSearchResponseCopyWithImpl<$Res>
    implements $NewsSearchResponseCopyWith<$Res> {
  _$NewsSearchResponseCopyWithImpl(this._value, this._then);

  final NewsSearchResponse _value;
  // ignore: unused_field
  final $Res Function(NewsSearchResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>?,
    ));
  }
}

/// @nodoc
abstract class _$NewsSearchResponseCopyWith<$Res>
    implements $NewsSearchResponseCopyWith<$Res> {
  factory _$NewsSearchResponseCopyWith(
          _NewsSearchResponse value, $Res Function(_NewsSearchResponse) then) =
      __$NewsSearchResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class __$NewsSearchResponseCopyWithImpl<$Res>
    extends _$NewsSearchResponseCopyWithImpl<$Res>
    implements _$NewsSearchResponseCopyWith<$Res> {
  __$NewsSearchResponseCopyWithImpl(
      _NewsSearchResponse _value, $Res Function(_NewsSearchResponse) _then)
      : super(_value, (v) => _then(v as _NewsSearchResponse));

  @override
  _NewsSearchResponse get _value => super._value as _NewsSearchResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_NewsSearchResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsSearchResponse extends _NewsSearchResponse {
  _$_NewsSearchResponse({this.status, this.totalResults, this.articles})
      : super._();

  factory _$_NewsSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$$_NewsSearchResponseFromJson(json);

  @override
  final String? status;
  @override
  final int? totalResults;
  @override
  final List<NewsArticle>? articles;

  @override
  String toString() {
    return 'NewsSearchResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsSearchResponse &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults) &&
            const DeepCollectionEquality().equals(other.articles, articles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(totalResults),
      const DeepCollectionEquality().hash(articles));

  @JsonKey(ignore: true)
  @override
  _$NewsSearchResponseCopyWith<_NewsSearchResponse> get copyWith =>
      __$NewsSearchResponseCopyWithImpl<_NewsSearchResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsSearchResponseToJson(this);
  }
}

abstract class _NewsSearchResponse extends NewsSearchResponse {
  factory _NewsSearchResponse(
      {String? status,
      int? totalResults,
      List<NewsArticle>? articles}) = _$_NewsSearchResponse;
  _NewsSearchResponse._() : super._();

  factory _NewsSearchResponse.fromJson(Map<String, dynamic> json) =
      _$_NewsSearchResponse.fromJson;

  @override
  String? get status;
  @override
  int? get totalResults;
  @override
  List<NewsArticle>? get articles;
  @override
  @JsonKey(ignore: true)
  _$NewsSearchResponseCopyWith<_NewsSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
