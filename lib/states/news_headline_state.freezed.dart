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
      {List<NewsArticle> articles = const <NewsArticle>[],
      bool fetching = false}) {
    return _NewsHeadlineState(
      articles: articles,
      fetching: fetching,
    );
  }
}

/// @nodoc
const $NewsHeadlineState = _$NewsHeadlineStateTearOff();

/// @nodoc
mixin _$NewsHeadlineState {
  List<NewsArticle> get articles => throw _privateConstructorUsedError;
  bool get fetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsHeadlineStateCopyWith<NewsHeadlineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsHeadlineStateCopyWith<$Res> {
  factory $NewsHeadlineStateCopyWith(
          NewsHeadlineState value, $Res Function(NewsHeadlineState) then) =
      _$NewsHeadlineStateCopyWithImpl<$Res>;
  $Res call({List<NewsArticle> articles, bool fetching});
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
abstract class _$NewsHeadlineStateCopyWith<$Res>
    implements $NewsHeadlineStateCopyWith<$Res> {
  factory _$NewsHeadlineStateCopyWith(
          _NewsHeadlineState value, $Res Function(_NewsHeadlineState) then) =
      __$NewsHeadlineStateCopyWithImpl<$Res>;
  @override
  $Res call({List<NewsArticle> articles, bool fetching});
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
    Object? articles = freezed,
    Object? fetching = freezed,
  }) {
    return _then(_NewsHeadlineState(
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

class _$_NewsHeadlineState extends _NewsHeadlineState {
  _$_NewsHeadlineState(
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
    return 'NewsHeadlineState(articles: $articles, fetching: $fetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsHeadlineState &&
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
  _$NewsHeadlineStateCopyWith<_NewsHeadlineState> get copyWith =>
      __$NewsHeadlineStateCopyWithImpl<_NewsHeadlineState>(this, _$identity);
}

abstract class _NewsHeadlineState extends NewsHeadlineState {
  factory _NewsHeadlineState({List<NewsArticle> articles, bool fetching}) =
      _$_NewsHeadlineState;
  _NewsHeadlineState._() : super._();

  @override
  List<NewsArticle> get articles;
  @override
  bool get fetching;
  @override
  @JsonKey(ignore: true)
  _$NewsHeadlineStateCopyWith<_NewsHeadlineState> get copyWith =>
      throw _privateConstructorUsedError;
}
