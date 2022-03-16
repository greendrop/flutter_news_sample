// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewsSearchStateTearOff {
  const _$NewsSearchStateTearOff();

  _NewsSearchState call(
      {List<NewsArticle> articles = const <NewsArticle>[],
      bool fetching = false}) {
    return _NewsSearchState(
      articles: articles,
      fetching: fetching,
    );
  }
}

/// @nodoc
const $NewsSearchState = _$NewsSearchStateTearOff();

/// @nodoc
mixin _$NewsSearchState {
  List<NewsArticle> get articles => throw _privateConstructorUsedError;
  bool get fetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsSearchStateCopyWith<NewsSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsSearchStateCopyWith<$Res> {
  factory $NewsSearchStateCopyWith(
          NewsSearchState value, $Res Function(NewsSearchState) then) =
      _$NewsSearchStateCopyWithImpl<$Res>;
  $Res call({List<NewsArticle> articles, bool fetching});
}

/// @nodoc
class _$NewsSearchStateCopyWithImpl<$Res>
    implements $NewsSearchStateCopyWith<$Res> {
  _$NewsSearchStateCopyWithImpl(this._value, this._then);

  final NewsSearchState _value;
  // ignore: unused_field
  final $Res Function(NewsSearchState) _then;

  @override
  $Res call({
    Object? articles = freezed,
    Object? fetching = freezed,
  }) {
    return _then(_value.copyWith(
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>,
      fetching: fetching == freezed
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$NewsSearchStateCopyWith<$Res>
    implements $NewsSearchStateCopyWith<$Res> {
  factory _$NewsSearchStateCopyWith(
          _NewsSearchState value, $Res Function(_NewsSearchState) then) =
      __$NewsSearchStateCopyWithImpl<$Res>;
  @override
  $Res call({List<NewsArticle> articles, bool fetching});
}

/// @nodoc
class __$NewsSearchStateCopyWithImpl<$Res>
    extends _$NewsSearchStateCopyWithImpl<$Res>
    implements _$NewsSearchStateCopyWith<$Res> {
  __$NewsSearchStateCopyWithImpl(
      _NewsSearchState _value, $Res Function(_NewsSearchState) _then)
      : super(_value, (v) => _then(v as _NewsSearchState));

  @override
  _NewsSearchState get _value => super._value as _NewsSearchState;

  @override
  $Res call({
    Object? articles = freezed,
    Object? fetching = freezed,
  }) {
    return _then(_NewsSearchState(
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticle>,
      fetching: fetching == freezed
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NewsSearchState extends _NewsSearchState {
  _$_NewsSearchState(
      {this.articles = const <NewsArticle>[], this.fetching = false})
      : super._();

  @JsonKey()
  @override
  final List<NewsArticle> articles;
  @JsonKey()
  @override
  final bool fetching;

  @override
  String toString() {
    return 'NewsSearchState(articles: $articles, fetching: $fetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsSearchState &&
            const DeepCollectionEquality().equals(other.articles, articles) &&
            const DeepCollectionEquality().equals(other.fetching, fetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(articles),
      const DeepCollectionEquality().hash(fetching));

  @JsonKey(ignore: true)
  @override
  _$NewsSearchStateCopyWith<_NewsSearchState> get copyWith =>
      __$NewsSearchStateCopyWithImpl<_NewsSearchState>(this, _$identity);
}

abstract class _NewsSearchState extends NewsSearchState {
  factory _NewsSearchState({List<NewsArticle> articles, bool fetching}) =
      _$_NewsSearchState;
  _NewsSearchState._() : super._();

  @override
  List<NewsArticle> get articles;
  @override
  bool get fetching;
  @override
  @JsonKey(ignore: true)
  _$NewsSearchStateCopyWith<_NewsSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
