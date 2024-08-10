// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_everything_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsEvrythingResponse _$NewsEvrythingResponseFromJson(
    Map<String, dynamic> json) {
  return _NewsEvrythingResponse.fromJson(json);
}

/// @nodoc
mixin _$NewsEvrythingResponse {
  String? get status => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  List<NewsArticle>? get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsEvrythingResponseCopyWith<NewsEvrythingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEvrythingResponseCopyWith<$Res> {
  factory $NewsEvrythingResponseCopyWith(NewsEvrythingResponse value,
          $Res Function(NewsEvrythingResponse) then) =
      _$NewsEvrythingResponseCopyWithImpl<$Res, NewsEvrythingResponse>;
  @useResult
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class _$NewsEvrythingResponseCopyWithImpl<$Res,
        $Val extends NewsEvrythingResponse>
    implements $NewsEvrythingResponseCopyWith<$Res> {
  _$NewsEvrythingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: freezed == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsEvrythingResponseImplCopyWith<$Res>
    implements $NewsEvrythingResponseCopyWith<$Res> {
  factory _$$NewsEvrythingResponseImplCopyWith(
          _$NewsEvrythingResponseImpl value,
          $Res Function(_$NewsEvrythingResponseImpl) then) =
      __$$NewsEvrythingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class __$$NewsEvrythingResponseImplCopyWithImpl<$Res>
    extends _$NewsEvrythingResponseCopyWithImpl<$Res,
        _$NewsEvrythingResponseImpl>
    implements _$$NewsEvrythingResponseImplCopyWith<$Res> {
  __$$NewsEvrythingResponseImplCopyWithImpl(_$NewsEvrythingResponseImpl _value,
      $Res Function(_$NewsEvrythingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_$NewsEvrythingResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: freezed == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: freezed == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsEvrythingResponseImpl extends _NewsEvrythingResponse {
  _$NewsEvrythingResponseImpl(
      {this.status, this.totalResults, final List<NewsArticle>? articles})
      : _articles = articles,
        super._();

  factory _$NewsEvrythingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsEvrythingResponseImplFromJson(json);

  @override
  final String? status;
  @override
  final int? totalResults;
  final List<NewsArticle>? _articles;
  @override
  List<NewsArticle>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NewsEvrythingResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsEvrythingResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, totalResults,
      const DeepCollectionEquality().hash(_articles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsEvrythingResponseImplCopyWith<_$NewsEvrythingResponseImpl>
      get copyWith => __$$NewsEvrythingResponseImplCopyWithImpl<
          _$NewsEvrythingResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsEvrythingResponseImplToJson(
      this,
    );
  }
}

abstract class _NewsEvrythingResponse extends NewsEvrythingResponse {
  factory _NewsEvrythingResponse(
      {final String? status,
      final int? totalResults,
      final List<NewsArticle>? articles}) = _$NewsEvrythingResponseImpl;
  _NewsEvrythingResponse._() : super._();

  factory _NewsEvrythingResponse.fromJson(Map<String, dynamic> json) =
      _$NewsEvrythingResponseImpl.fromJson;

  @override
  String? get status;
  @override
  int? get totalResults;
  @override
  List<NewsArticle>? get articles;
  @override
  @JsonKey(ignore: true)
  _$$NewsEvrythingResponseImplCopyWith<_$NewsEvrythingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
