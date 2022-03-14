// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_headline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewsHeadlineStateTearOff {
  const _$NewsHeadlineStateTearOff();

  _NewsHeadlineState call(
      {Map<String, List<NewsArticle>> categoryArticles =
          const <String, List<NewsArticle>>{},
      Map<String, bool> categoryArticlesFetching = const <String, bool>{}}) {
    return _NewsHeadlineState(
      categoryArticles: categoryArticles,
      categoryArticlesFetching: categoryArticlesFetching,
    );
  }
}

/// @nodoc
const $NewsHeadlineState = _$NewsHeadlineStateTearOff();

/// @nodoc
mixin _$NewsHeadlineState {
  Map<String, List<NewsArticle>> get categoryArticles =>
      throw _privateConstructorUsedError;
  Map<String, bool> get categoryArticlesFetching =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsHeadlineStateCopyWith<NewsHeadlineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsHeadlineStateCopyWith<$Res> {
  factory $NewsHeadlineStateCopyWith(
          NewsHeadlineState value, $Res Function(NewsHeadlineState) then) =
      _$NewsHeadlineStateCopyWithImpl<$Res>;
  $Res call(
      {Map<String, List<NewsArticle>> categoryArticles,
      Map<String, bool> categoryArticlesFetching});
}

/// @nodoc
class _$NewsHeadlineStateCopyWithImpl<$Res>
    implements $NewsHeadlineStateCopyWith<$Res> {
  _$NewsHeadlineStateCopyWithImpl(this._value, this._then);

  final NewsHeadlineState _value;
  // ignore: unused_field
  final $Res Function(NewsHeadlineState) _then;

  @override
  $Res call({
    Object? categoryArticles = freezed,
    Object? categoryArticlesFetching = freezed,
  }) {
    return _then(_value.copyWith(
      categoryArticles: categoryArticles == freezed
          ? _value.categoryArticles
          : categoryArticles // ignore: cast_nullable_to_non_nullable
              as Map<String, List<NewsArticle>>,
      categoryArticlesFetching: categoryArticlesFetching == freezed
          ? _value.categoryArticlesFetching
          : categoryArticlesFetching // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc
abstract class _$NewsHeadlineStateCopyWith<$Res>
    implements $NewsHeadlineStateCopyWith<$Res> {
  factory _$NewsHeadlineStateCopyWith(
          _NewsHeadlineState value, $Res Function(_NewsHeadlineState) then) =
      __$NewsHeadlineStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, List<NewsArticle>> categoryArticles,
      Map<String, bool> categoryArticlesFetching});
}

/// @nodoc
class __$NewsHeadlineStateCopyWithImpl<$Res>
    extends _$NewsHeadlineStateCopyWithImpl<$Res>
    implements _$NewsHeadlineStateCopyWith<$Res> {
  __$NewsHeadlineStateCopyWithImpl(
      _NewsHeadlineState _value, $Res Function(_NewsHeadlineState) _then)
      : super(_value, (v) => _then(v as _NewsHeadlineState));

  @override
  _NewsHeadlineState get _value => super._value as _NewsHeadlineState;

  @override
  $Res call({
    Object? categoryArticles = freezed,
    Object? categoryArticlesFetching = freezed,
  }) {
    return _then(_NewsHeadlineState(
      categoryArticles: categoryArticles == freezed
          ? _value.categoryArticles
          : categoryArticles // ignore: cast_nullable_to_non_nullable
              as Map<String, List<NewsArticle>>,
      categoryArticlesFetching: categoryArticlesFetching == freezed
          ? _value.categoryArticlesFetching
          : categoryArticlesFetching // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
    ));
  }
}

/// @nodoc

class _$_NewsHeadlineState extends _NewsHeadlineState {
  _$_NewsHeadlineState(
      {this.categoryArticles = const <String, List<NewsArticle>>{},
      this.categoryArticlesFetching = const <String, bool>{}})
      : super._();

  @JsonKey()
  @override
  final Map<String, List<NewsArticle>> categoryArticles;
  @JsonKey()
  @override
  final Map<String, bool> categoryArticlesFetching;

  @override
  String toString() {
    return 'NewsHeadlineState(categoryArticles: $categoryArticles, categoryArticlesFetching: $categoryArticlesFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsHeadlineState &&
            const DeepCollectionEquality()
                .equals(other.categoryArticles, categoryArticles) &&
            const DeepCollectionEquality().equals(
                other.categoryArticlesFetching, categoryArticlesFetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryArticles),
      const DeepCollectionEquality().hash(categoryArticlesFetching));

  @JsonKey(ignore: true)
  @override
  _$NewsHeadlineStateCopyWith<_NewsHeadlineState> get copyWith =>
      __$NewsHeadlineStateCopyWithImpl<_NewsHeadlineState>(this, _$identity);
}

abstract class _NewsHeadlineState extends NewsHeadlineState {
  factory _NewsHeadlineState(
      {Map<String, List<NewsArticle>> categoryArticles,
      Map<String, bool> categoryArticlesFetching}) = _$_NewsHeadlineState;
  _NewsHeadlineState._() : super._();

  @override
  Map<String, List<NewsArticle>> get categoryArticles;
  @override
  Map<String, bool> get categoryArticlesFetching;
  @override
  @JsonKey(ignore: true)
  _$NewsHeadlineStateCopyWith<_NewsHeadlineState> get copyWith =>
      throw _privateConstructorUsedError;
}
