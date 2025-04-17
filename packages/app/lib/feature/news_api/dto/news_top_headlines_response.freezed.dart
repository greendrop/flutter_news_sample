// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_top_headlines_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsTopHeadlinesResponse {

 String? get status; int? get totalResults; List<NewsArticle>? get articles;
/// Create a copy of NewsTopHeadlinesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsTopHeadlinesResponseCopyWith<NewsTopHeadlinesResponse> get copyWith => _$NewsTopHeadlinesResponseCopyWithImpl<NewsTopHeadlinesResponse>(this as NewsTopHeadlinesResponse, _$identity);

  /// Serializes this NewsTopHeadlinesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsTopHeadlinesResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.articles, articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(articles));

@override
String toString() {
  return 'NewsTopHeadlinesResponse(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class $NewsTopHeadlinesResponseCopyWith<$Res>  {
  factory $NewsTopHeadlinesResponseCopyWith(NewsTopHeadlinesResponse value, $Res Function(NewsTopHeadlinesResponse) _then) = _$NewsTopHeadlinesResponseCopyWithImpl;
@useResult
$Res call({
 String? status, int? totalResults, List<NewsArticle>? articles
});




}
/// @nodoc
class _$NewsTopHeadlinesResponseCopyWithImpl<$Res>
    implements $NewsTopHeadlinesResponseCopyWith<$Res> {
  _$NewsTopHeadlinesResponseCopyWithImpl(this._self, this._then);

  final NewsTopHeadlinesResponse _self;
  final $Res Function(NewsTopHeadlinesResponse) _then;

/// Create a copy of NewsTopHeadlinesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? totalResults = freezed,Object? articles = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int?,articles: freezed == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<NewsArticle>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NewsTopHeadlinesResponse extends NewsTopHeadlinesResponse {
   _NewsTopHeadlinesResponse({this.status, this.totalResults, final  List<NewsArticle>? articles}): _articles = articles,super._();
  factory _NewsTopHeadlinesResponse.fromJson(Map<String, dynamic> json) => _$NewsTopHeadlinesResponseFromJson(json);

@override final  String? status;
@override final  int? totalResults;
 final  List<NewsArticle>? _articles;
@override List<NewsArticle>? get articles {
  final value = _articles;
  if (value == null) return null;
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of NewsTopHeadlinesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsTopHeadlinesResponseCopyWith<_NewsTopHeadlinesResponse> get copyWith => __$NewsTopHeadlinesResponseCopyWithImpl<_NewsTopHeadlinesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsTopHeadlinesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsTopHeadlinesResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._articles, _articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(_articles));

@override
String toString() {
  return 'NewsTopHeadlinesResponse(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class _$NewsTopHeadlinesResponseCopyWith<$Res> implements $NewsTopHeadlinesResponseCopyWith<$Res> {
  factory _$NewsTopHeadlinesResponseCopyWith(_NewsTopHeadlinesResponse value, $Res Function(_NewsTopHeadlinesResponse) _then) = __$NewsTopHeadlinesResponseCopyWithImpl;
@override @useResult
$Res call({
 String? status, int? totalResults, List<NewsArticle>? articles
});




}
/// @nodoc
class __$NewsTopHeadlinesResponseCopyWithImpl<$Res>
    implements _$NewsTopHeadlinesResponseCopyWith<$Res> {
  __$NewsTopHeadlinesResponseCopyWithImpl(this._self, this._then);

  final _NewsTopHeadlinesResponse _self;
  final $Res Function(_NewsTopHeadlinesResponse) _then;

/// Create a copy of NewsTopHeadlinesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? totalResults = freezed,Object? articles = freezed,}) {
  return _then(_NewsTopHeadlinesResponse(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int?,articles: freezed == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<NewsArticle>?,
  ));
}


}

// dart format on
