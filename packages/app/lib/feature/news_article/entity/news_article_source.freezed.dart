// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_article_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsArticleSource {

 String? get id; String? get name;
/// Create a copy of NewsArticleSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsArticleSourceCopyWith<NewsArticleSource> get copyWith => _$NewsArticleSourceCopyWithImpl<NewsArticleSource>(this as NewsArticleSource, _$identity);

  /// Serializes this NewsArticleSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsArticleSource&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'NewsArticleSource(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $NewsArticleSourceCopyWith<$Res>  {
  factory $NewsArticleSourceCopyWith(NewsArticleSource value, $Res Function(NewsArticleSource) _then) = _$NewsArticleSourceCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$NewsArticleSourceCopyWithImpl<$Res>
    implements $NewsArticleSourceCopyWith<$Res> {
  _$NewsArticleSourceCopyWithImpl(this._self, this._then);

  final NewsArticleSource _self;
  final $Res Function(NewsArticleSource) _then;

/// Create a copy of NewsArticleSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NewsArticleSource extends NewsArticleSource {
   _NewsArticleSource({this.id, this.name}): super._();
  factory _NewsArticleSource.fromJson(Map<String, dynamic> json) => _$NewsArticleSourceFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of NewsArticleSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsArticleSourceCopyWith<_NewsArticleSource> get copyWith => __$NewsArticleSourceCopyWithImpl<_NewsArticleSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsArticleSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsArticleSource&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'NewsArticleSource(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$NewsArticleSourceCopyWith<$Res> implements $NewsArticleSourceCopyWith<$Res> {
  factory _$NewsArticleSourceCopyWith(_NewsArticleSource value, $Res Function(_NewsArticleSource) _then) = __$NewsArticleSourceCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$NewsArticleSourceCopyWithImpl<$Res>
    implements _$NewsArticleSourceCopyWith<$Res> {
  __$NewsArticleSourceCopyWithImpl(this._self, this._then);

  final _NewsArticleSource _self;
  final $Res Function(_NewsArticleSource) _then;

/// Create a copy of NewsArticleSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_NewsArticleSource(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
