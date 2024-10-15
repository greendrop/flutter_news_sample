// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_articles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsArticles {
  String get keyword => throw _privateConstructorUsedError;
  List<NewsArticle> get items => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;

  /// Create a copy of NewsArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsArticlesCopyWith<NewsArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsArticlesCopyWith<$Res> {
  factory $NewsArticlesCopyWith(
          NewsArticles value, $Res Function(NewsArticles) then) =
      _$NewsArticlesCopyWithImpl<$Res, NewsArticles>;
  @useResult
  $Res call(
      {String keyword,
      List<NewsArticle> items,
      bool hasNextPage,
      int currentPage});
}

/// @nodoc
class _$NewsArticlesCopyWithImpl<$Res, $Val extends NewsArticles>
    implements $NewsArticlesCopyWith<$Res> {
  _$NewsArticlesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? items = null,
    Object? hasNextPage = null,
    Object? currentPage = null,
  }) {
    return _then(_value.copyWith(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsArticlesImplCopyWith<$Res>
    implements $NewsArticlesCopyWith<$Res> {
  factory _$$NewsArticlesImplCopyWith(
          _$NewsArticlesImpl value, $Res Function(_$NewsArticlesImpl) then) =
      __$$NewsArticlesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String keyword,
      List<NewsArticle> items,
      bool hasNextPage,
      int currentPage});
}

/// @nodoc
class __$$NewsArticlesImplCopyWithImpl<$Res>
    extends _$NewsArticlesCopyWithImpl<$Res, _$NewsArticlesImpl>
    implements _$$NewsArticlesImplCopyWith<$Res> {
  __$$NewsArticlesImplCopyWithImpl(
      _$NewsArticlesImpl _value, $Res Function(_$NewsArticlesImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsArticles
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = null,
    Object? items = null,
    Object? hasNextPage = null,
    Object? currentPage = null,
  }) {
    return _then(_$NewsArticlesImpl(
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NewsArticlesImpl extends _NewsArticles {
  _$NewsArticlesImpl(
      {this.keyword = '',
      final List<NewsArticle> items = const [],
      this.hasNextPage = false,
      this.currentPage = 1})
      : _items = items,
        super._();

  @override
  @JsonKey()
  final String keyword;
  final List<NewsArticle> _items;
  @override
  @JsonKey()
  List<NewsArticle> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool hasNextPage;
  @override
  @JsonKey()
  final int currentPage;

  @override
  String toString() {
    return 'NewsArticles(keyword: $keyword, items: $items, hasNextPage: $hasNextPage, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsArticlesImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword,
      const DeepCollectionEquality().hash(_items), hasNextPage, currentPage);

  /// Create a copy of NewsArticles
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsArticlesImplCopyWith<_$NewsArticlesImpl> get copyWith =>
      __$$NewsArticlesImplCopyWithImpl<_$NewsArticlesImpl>(this, _$identity);
}

abstract class _NewsArticles extends NewsArticles {
  factory _NewsArticles(
      {final String keyword,
      final List<NewsArticle> items,
      final bool hasNextPage,
      final int currentPage}) = _$NewsArticlesImpl;
  _NewsArticles._() : super._();

  @override
  String get keyword;
  @override
  List<NewsArticle> get items;
  @override
  bool get hasNextPage;
  @override
  int get currentPage;

  /// Create a copy of NewsArticles
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsArticlesImplCopyWith<_$NewsArticlesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
