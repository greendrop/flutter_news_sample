// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsArticle _$NewsArticleFromJson(Map<String, dynamic> json) {
  return _NewsArticle.fromJson(json);
}

/// @nodoc
class _$NewsArticleTearOff {
  const _$NewsArticleTearOff();

  _NewsArticle call({String? title, String? url, String? imageUrl}) {
    return _NewsArticle(
      title: title,
      url: url,
      imageUrl: imageUrl,
    );
  }

  NewsArticle fromJson(Map<String, Object?> json) {
    return NewsArticle.fromJson(json);
  }
}

/// @nodoc
const $NewsArticle = _$NewsArticleTearOff();

/// @nodoc
mixin _$NewsArticle {
  String? get title => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsArticleCopyWith<NewsArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsArticleCopyWith<$Res> {
  factory $NewsArticleCopyWith(
          NewsArticle value, $Res Function(NewsArticle) then) =
      _$NewsArticleCopyWithImpl<$Res>;
  $Res call({String? title, String? url, String? imageUrl});
}

/// @nodoc
class _$NewsArticleCopyWithImpl<$Res> implements $NewsArticleCopyWith<$Res> {
  _$NewsArticleCopyWithImpl(this._value, this._then);

  final NewsArticle _value;
  // ignore: unused_field
  final $Res Function(NewsArticle) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NewsArticleCopyWith<$Res>
    implements $NewsArticleCopyWith<$Res> {
  factory _$NewsArticleCopyWith(
          _NewsArticle value, $Res Function(_NewsArticle) then) =
      __$NewsArticleCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? url, String? imageUrl});
}

/// @nodoc
class __$NewsArticleCopyWithImpl<$Res> extends _$NewsArticleCopyWithImpl<$Res>
    implements _$NewsArticleCopyWith<$Res> {
  __$NewsArticleCopyWithImpl(
      _NewsArticle _value, $Res Function(_NewsArticle) _then)
      : super(_value, (v) => _then(v as _NewsArticle));

  @override
  _NewsArticle get _value => super._value as _NewsArticle;

  @override
  $Res call({
    Object? title = freezed,
    Object? url = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_NewsArticle(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsArticle extends _NewsArticle {
  _$_NewsArticle({this.title, this.url, this.imageUrl}) : super._();

  factory _$_NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$$_NewsArticleFromJson(json);

  @override
  final String? title;
  @override
  final String? url;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'NewsArticle(title: $title, url: $url, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsArticle &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(imageUrl));

  @JsonKey(ignore: true)
  @override
  _$NewsArticleCopyWith<_NewsArticle> get copyWith =>
      __$NewsArticleCopyWithImpl<_NewsArticle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsArticleToJson(this);
  }
}

abstract class _NewsArticle extends NewsArticle {
  factory _NewsArticle({String? title, String? url, String? imageUrl}) =
      _$_NewsArticle;
  _NewsArticle._() : super._();

  factory _NewsArticle.fromJson(Map<String, dynamic> json) =
      _$_NewsArticle.fromJson;

  @override
  String? get title;
  @override
  String? get url;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$NewsArticleCopyWith<_NewsArticle> get copyWith =>
      throw _privateConstructorUsedError;
}
