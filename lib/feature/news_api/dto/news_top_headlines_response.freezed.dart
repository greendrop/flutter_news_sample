// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_top_headlines_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsTopHeadlinesResponse _$NewsTopHeadlinesResponseFromJson(
    Map<String, dynamic> json) {
  return _NewsTopHeadlinesResponse.fromJson(json);
}

/// @nodoc
mixin _$NewsTopHeadlinesResponse {
  String? get status => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  List<NewsArticle>? get articles => throw _privateConstructorUsedError;

  /// Serializes this NewsTopHeadlinesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsTopHeadlinesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsTopHeadlinesResponseCopyWith<NewsTopHeadlinesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsTopHeadlinesResponseCopyWith<$Res> {
  factory $NewsTopHeadlinesResponseCopyWith(NewsTopHeadlinesResponse value,
          $Res Function(NewsTopHeadlinesResponse) then) =
      _$NewsTopHeadlinesResponseCopyWithImpl<$Res, NewsTopHeadlinesResponse>;
  @useResult
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class _$NewsTopHeadlinesResponseCopyWithImpl<$Res,
        $Val extends NewsTopHeadlinesResponse>
    implements $NewsTopHeadlinesResponseCopyWith<$Res> {
  _$NewsTopHeadlinesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsTopHeadlinesResponse
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$NewsTopHeadlinesResponseImplCopyWith<$Res>
    implements $NewsTopHeadlinesResponseCopyWith<$Res> {
  factory _$$NewsTopHeadlinesResponseImplCopyWith(
          _$NewsTopHeadlinesResponseImpl value,
          $Res Function(_$NewsTopHeadlinesResponseImpl) then) =
      __$$NewsTopHeadlinesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, int? totalResults, List<NewsArticle>? articles});
}

/// @nodoc
class __$$NewsTopHeadlinesResponseImplCopyWithImpl<$Res>
    extends _$NewsTopHeadlinesResponseCopyWithImpl<$Res,
        _$NewsTopHeadlinesResponseImpl>
    implements _$$NewsTopHeadlinesResponseImplCopyWith<$Res> {
  __$$NewsTopHeadlinesResponseImplCopyWithImpl(
      _$NewsTopHeadlinesResponseImpl _value,
      $Res Function(_$NewsTopHeadlinesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsTopHeadlinesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_$NewsTopHeadlinesResponseImpl(
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
class _$NewsTopHeadlinesResponseImpl extends _NewsTopHeadlinesResponse {
  _$NewsTopHeadlinesResponseImpl(
      {this.status, this.totalResults, final List<NewsArticle>? articles})
      : _articles = articles,
        super._();

  factory _$NewsTopHeadlinesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsTopHeadlinesResponseImplFromJson(json);

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
    return 'NewsTopHeadlinesResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsTopHeadlinesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, totalResults,
      const DeepCollectionEquality().hash(_articles));

  /// Create a copy of NewsTopHeadlinesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsTopHeadlinesResponseImplCopyWith<_$NewsTopHeadlinesResponseImpl>
      get copyWith => __$$NewsTopHeadlinesResponseImplCopyWithImpl<
          _$NewsTopHeadlinesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsTopHeadlinesResponseImplToJson(
      this,
    );
  }
}

abstract class _NewsTopHeadlinesResponse extends NewsTopHeadlinesResponse {
  factory _NewsTopHeadlinesResponse(
      {final String? status,
      final int? totalResults,
      final List<NewsArticle>? articles}) = _$NewsTopHeadlinesResponseImpl;
  _NewsTopHeadlinesResponse._() : super._();

  factory _NewsTopHeadlinesResponse.fromJson(Map<String, dynamic> json) =
      _$NewsTopHeadlinesResponseImpl.fromJson;

  @override
  String? get status;
  @override
  int? get totalResults;
  @override
  List<NewsArticle>? get articles;

  /// Create a copy of NewsTopHeadlinesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsTopHeadlinesResponseImplCopyWith<_$NewsTopHeadlinesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
