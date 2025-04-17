// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_everything_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsEverythingResponse {

 String? get status; int? get totalResults; List<NewsArticle>? get articles;
/// Create a copy of NewsEverythingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsEverythingResponseCopyWith<NewsEverythingResponse> get copyWith => _$NewsEverythingResponseCopyWithImpl<NewsEverythingResponse>(this as NewsEverythingResponse, _$identity);

  /// Serializes this NewsEverythingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsEverythingResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.articles, articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(articles));

@override
String toString() {
  return 'NewsEverythingResponse(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class $NewsEverythingResponseCopyWith<$Res>  {
  factory $NewsEverythingResponseCopyWith(NewsEverythingResponse value, $Res Function(NewsEverythingResponse) _then) = _$NewsEverythingResponseCopyWithImpl;
@useResult
$Res call({
 String? status, int? totalResults, List<NewsArticle>? articles
});




}
/// @nodoc
class _$NewsEverythingResponseCopyWithImpl<$Res>
    implements $NewsEverythingResponseCopyWith<$Res> {
  _$NewsEverythingResponseCopyWithImpl(this._self, this._then);

  final NewsEverythingResponse _self;
  final $Res Function(NewsEverythingResponse) _then;

/// Create a copy of NewsEverythingResponse
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

class _NewsEverythingResponse extends NewsEverythingResponse {
   _NewsEverythingResponse({this.status, this.totalResults, final  List<NewsArticle>? articles}): _articles = articles,super._();
  factory _NewsEverythingResponse.fromJson(Map<String, dynamic> json) => _$NewsEverythingResponseFromJson(json);

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


/// Create a copy of NewsEverythingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsEverythingResponseCopyWith<_NewsEverythingResponse> get copyWith => __$NewsEverythingResponseCopyWithImpl<_NewsEverythingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsEverythingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsEverythingResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._articles, _articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(_articles));

@override
String toString() {
  return 'NewsEverythingResponse(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class _$NewsEverythingResponseCopyWith<$Res> implements $NewsEverythingResponseCopyWith<$Res> {
  factory _$NewsEverythingResponseCopyWith(_NewsEverythingResponse value, $Res Function(_NewsEverythingResponse) _then) = __$NewsEverythingResponseCopyWithImpl;
@override @useResult
$Res call({
 String? status, int? totalResults, List<NewsArticle>? articles
});




}
/// @nodoc
class __$NewsEverythingResponseCopyWithImpl<$Res>
    implements _$NewsEverythingResponseCopyWith<$Res> {
  __$NewsEverythingResponseCopyWithImpl(this._self, this._then);

  final _NewsEverythingResponse _self;
  final $Res Function(_NewsEverythingResponse) _then;

/// Create a copy of NewsEverythingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? totalResults = freezed,Object? articles = freezed,}) {
  return _then(_NewsEverythingResponse(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int?,articles: freezed == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<NewsArticle>?,
  ));
}


}

// dart format on
