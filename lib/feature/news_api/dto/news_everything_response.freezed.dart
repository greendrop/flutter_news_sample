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

NewsEverythingResponse _$NewsEverythingResponseFromJson(
    Map<String, dynamic> json) {
  return _NewsEverythingResponse.fromJson(json);
}

/// @nodoc
mixin _$NewsEverythingResponse {
  String? get status => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  List<NewsArticle>? get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsEverythingResponseCopyWith<NewsEverythingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsEverythingResponseCopyWith<$Res> {
  factory $NewsEverythingResponseCopyWith(NewsEverythingResponse value,
          $Res Function(NewsEverythingResponse) then) =
      _$NewsEverythingResponseCopyWithImpl<$Res, NewsEverythingResponse>;
  @useResult
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class _$NewsEverythingResponseCopyWithImpl<$Res,
        $Val extends NewsEverythingResponse>
    implements $NewsEverythingResponseCopyWith<$Res> {
  _$NewsEverythingResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$NewsEverythingResponseImplCopyWith<$Res>
    implements $NewsEverythingResponseCopyWith<$Res> {
  factory _$$NewsEverythingResponseImplCopyWith(
          _$NewsEverythingResponseImpl value,
          $Res Function(_$NewsEverythingResponseImpl) then) =
      __$$NewsEverythingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class __$$NewsEverythingResponseImplCopyWithImpl<$Res>
    extends _$NewsEverythingResponseCopyWithImpl<$Res,
        _$NewsEverythingResponseImpl>
    implements _$$NewsEverythingResponseImplCopyWith<$Res> {
  __$$NewsEverythingResponseImplCopyWithImpl(
      _$NewsEverythingResponseImpl _value,
      $Res Function(_$NewsEverythingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_$NewsEverythingResponseImpl(
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
class _$NewsEverythingResponseImpl extends _NewsEverythingResponse {
  _$NewsEverythingResponseImpl(
      {this.status, this.totalResults, final List<NewsArticle>? articles})
      : _articles = articles,
        super._();

  factory _$NewsEverythingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsEverythingResponseImplFromJson(json);

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
    return 'NewsEverythingResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsEverythingResponseImpl &&
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
  _$$NewsEverythingResponseImplCopyWith<_$NewsEverythingResponseImpl>
      get copyWith => __$$NewsEverythingResponseImplCopyWithImpl<
          _$NewsEverythingResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsEverythingResponseImplToJson(
      this,
    );
  }
}

abstract class _NewsEverythingResponse extends NewsEverythingResponse {
  factory _NewsEverythingResponse(
      {final String? status,
      final int? totalResults,
      final List<NewsArticle>? articles}) = _$NewsEverythingResponseImpl;
  _NewsEverythingResponse._() : super._();

  factory _NewsEverythingResponse.fromJson(Map<String, dynamic> json) =
      _$NewsEverythingResponseImpl.fromJson;

  @override
  String? get status;
  @override
  int? get totalResults;
  @override
  List<NewsArticle>? get articles;
  @override
  @JsonKey(ignore: true)
  _$$NewsEverythingResponseImplCopyWith<_$NewsEverythingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
