// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_headline_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsHeadlineResponse _$NewsHeadlineResponseFromJson(Map<String, dynamic> json) {
  return _NewsHeadlineResponse.fromJson(json);
}

/// @nodoc
class _$NewsHeadlineResponseTearOff {
  const _$NewsHeadlineResponseTearOff();

  _NewsHeadlineResponse call(
      {String? status, int? totalResults, List<NewsArticle>? articles}) {
    return _NewsHeadlineResponse(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }

  NewsHeadlineResponse fromJson(Map<String, Object?> json) {
    return NewsHeadlineResponse.fromJson(json);
  }
}

/// @nodoc
const $NewsHeadlineResponse = _$NewsHeadlineResponseTearOff();

/// @nodoc
mixin _$NewsHeadlineResponse {
  String? get status => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  List<NewsArticle>? get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsHeadlineResponseCopyWith<NewsHeadlineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsHeadlineResponseCopyWith<$Res> {
  factory $NewsHeadlineResponseCopyWith(NewsHeadlineResponse value,
          $Res Function(NewsHeadlineResponse) then) =
      _$NewsHeadlineResponseCopyWithImpl<$Res>;
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class _$NewsHeadlineResponseCopyWithImpl<$Res>
    implements $NewsHeadlineResponseCopyWith<$Res> {
  _$NewsHeadlineResponseCopyWithImpl(this._value, this._then);

  final NewsHeadlineResponse _value;
  // ignore: unused_field
  final $Res Function(NewsHeadlineResponse) _then;

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
abstract class _$NewsHeadlineResponseCopyWith<$Res>
    implements $NewsHeadlineResponseCopyWith<$Res> {
  factory _$NewsHeadlineResponseCopyWith(_NewsHeadlineResponse value,
          $Res Function(_NewsHeadlineResponse) then) =
      __$NewsHeadlineResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class __$NewsHeadlineResponseCopyWithImpl<$Res>
    extends _$NewsHeadlineResponseCopyWithImpl<$Res>
    implements _$NewsHeadlineResponseCopyWith<$Res> {
  __$NewsHeadlineResponseCopyWithImpl(
      _NewsHeadlineResponse _value, $Res Function(_NewsHeadlineResponse) _then)
      : super(_value, (v) => _then(v as _NewsHeadlineResponse));

  @override
  _NewsHeadlineResponse get _value => super._value as _NewsHeadlineResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_NewsHeadlineResponse(
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
class _$_NewsHeadlineResponse extends _NewsHeadlineResponse {
  _$_NewsHeadlineResponse({this.status, this.totalResults, this.articles})
      : super._();

  factory _$_NewsHeadlineResponse.fromJson(Map<String, dynamic> json) =>
      _$$_NewsHeadlineResponseFromJson(json);

  @override
  final String? status;
  @override
  final int? totalResults;
  @override
  final List<NewsArticle>? articles;

  @override
  String toString() {
    return 'NewsHeadlineResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsHeadlineResponse &&
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
  _$NewsHeadlineResponseCopyWith<_NewsHeadlineResponse> get copyWith =>
      __$NewsHeadlineResponseCopyWithImpl<_NewsHeadlineResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsHeadlineResponseToJson(this);
  }
}

abstract class _NewsHeadlineResponse extends NewsHeadlineResponse {
  factory _NewsHeadlineResponse(
      {String? status,
      int? totalResults,
      List<NewsArticle>? articles}) = _$_NewsHeadlineResponse;
  _NewsHeadlineResponse._() : super._();

  factory _NewsHeadlineResponse.fromJson(Map<String, dynamic> json) =
      _$_NewsHeadlineResponse.fromJson;

  @override
  String? get status;
  @override
  int? get totalResults;
  @override
  List<NewsArticle>? get articles;
  @override
  @JsonKey(ignore: true)
  _$NewsHeadlineResponseCopyWith<_NewsHeadlineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
