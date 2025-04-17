// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_articles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewsArticles {

 List<NewsArticle> get items; bool get hasNextPage; int get currentPage;
/// Create a copy of NewsArticles
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsArticlesCopyWith<NewsArticles> get copyWith => _$NewsArticlesCopyWithImpl<NewsArticles>(this as NewsArticles, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsArticles&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),hasNextPage,currentPage);

@override
String toString() {
  return 'NewsArticles(items: $items, hasNextPage: $hasNextPage, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $NewsArticlesCopyWith<$Res>  {
  factory $NewsArticlesCopyWith(NewsArticles value, $Res Function(NewsArticles) _then) = _$NewsArticlesCopyWithImpl;
@useResult
$Res call({
 List<NewsArticle> items, bool hasNextPage, int currentPage
});




}
/// @nodoc
class _$NewsArticlesCopyWithImpl<$Res>
    implements $NewsArticlesCopyWith<$Res> {
  _$NewsArticlesCopyWithImpl(this._self, this._then);

  final NewsArticles _self;
  final $Res Function(NewsArticles) _then;

/// Create a copy of NewsArticles
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? hasNextPage = null,Object? currentPage = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<NewsArticle>,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _NewsArticles extends NewsArticles {
   _NewsArticles({final  List<NewsArticle> items = const [], this.hasNextPage = false, this.currentPage = 1}): _items = items,super._();
  

 final  List<NewsArticle> _items;
@override@JsonKey() List<NewsArticle> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool hasNextPage;
@override@JsonKey() final  int currentPage;

/// Create a copy of NewsArticles
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsArticlesCopyWith<_NewsArticles> get copyWith => __$NewsArticlesCopyWithImpl<_NewsArticles>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsArticles&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),hasNextPage,currentPage);

@override
String toString() {
  return 'NewsArticles(items: $items, hasNextPage: $hasNextPage, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class _$NewsArticlesCopyWith<$Res> implements $NewsArticlesCopyWith<$Res> {
  factory _$NewsArticlesCopyWith(_NewsArticles value, $Res Function(_NewsArticles) _then) = __$NewsArticlesCopyWithImpl;
@override @useResult
$Res call({
 List<NewsArticle> items, bool hasNextPage, int currentPage
});




}
/// @nodoc
class __$NewsArticlesCopyWithImpl<$Res>
    implements _$NewsArticlesCopyWith<$Res> {
  __$NewsArticlesCopyWithImpl(this._self, this._then);

  final _NewsArticles _self;
  final $Res Function(_NewsArticles) _then;

/// Create a copy of NewsArticles
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? hasNextPage = null,Object? currentPage = null,}) {
  return _then(_NewsArticles(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<NewsArticle>,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
