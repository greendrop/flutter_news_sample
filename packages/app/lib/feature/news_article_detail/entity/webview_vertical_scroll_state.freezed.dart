// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webview_vertical_scroll_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WebViewVerticalScrollState {

 WebviewVerticalScrollDirection get direction; int get value; int get position;
/// Create a copy of WebViewVerticalScrollState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebViewVerticalScrollStateCopyWith<WebViewVerticalScrollState> get copyWith => _$WebViewVerticalScrollStateCopyWithImpl<WebViewVerticalScrollState>(this as WebViewVerticalScrollState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WebViewVerticalScrollState&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.value, value) || other.value == value)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,direction,value,position);

@override
String toString() {
  return 'WebViewVerticalScrollState(direction: $direction, value: $value, position: $position)';
}


}

/// @nodoc
abstract mixin class $WebViewVerticalScrollStateCopyWith<$Res>  {
  factory $WebViewVerticalScrollStateCopyWith(WebViewVerticalScrollState value, $Res Function(WebViewVerticalScrollState) _then) = _$WebViewVerticalScrollStateCopyWithImpl;
@useResult
$Res call({
 WebviewVerticalScrollDirection direction, int value, int position
});




}
/// @nodoc
class _$WebViewVerticalScrollStateCopyWithImpl<$Res>
    implements $WebViewVerticalScrollStateCopyWith<$Res> {
  _$WebViewVerticalScrollStateCopyWithImpl(this._self, this._then);

  final WebViewVerticalScrollState _self;
  final $Res Function(WebViewVerticalScrollState) _then;

/// Create a copy of WebViewVerticalScrollState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? direction = null,Object? value = null,Object? position = null,}) {
  return _then(_self.copyWith(
direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as WebviewVerticalScrollDirection,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _WebViewVerticalScrollState extends WebViewVerticalScrollState {
   _WebViewVerticalScrollState({this.direction = WebviewVerticalScrollDirection.up, this.value = 0, this.position = 0}): super._();
  

@override@JsonKey() final  WebviewVerticalScrollDirection direction;
@override@JsonKey() final  int value;
@override@JsonKey() final  int position;

/// Create a copy of WebViewVerticalScrollState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WebViewVerticalScrollStateCopyWith<_WebViewVerticalScrollState> get copyWith => __$WebViewVerticalScrollStateCopyWithImpl<_WebViewVerticalScrollState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WebViewVerticalScrollState&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.value, value) || other.value == value)&&(identical(other.position, position) || other.position == position));
}


@override
int get hashCode => Object.hash(runtimeType,direction,value,position);

@override
String toString() {
  return 'WebViewVerticalScrollState(direction: $direction, value: $value, position: $position)';
}


}

/// @nodoc
abstract mixin class _$WebViewVerticalScrollStateCopyWith<$Res> implements $WebViewVerticalScrollStateCopyWith<$Res> {
  factory _$WebViewVerticalScrollStateCopyWith(_WebViewVerticalScrollState value, $Res Function(_WebViewVerticalScrollState) _then) = __$WebViewVerticalScrollStateCopyWithImpl;
@override @useResult
$Res call({
 WebviewVerticalScrollDirection direction, int value, int position
});




}
/// @nodoc
class __$WebViewVerticalScrollStateCopyWithImpl<$Res>
    implements _$WebViewVerticalScrollStateCopyWith<$Res> {
  __$WebViewVerticalScrollStateCopyWithImpl(this._self, this._then);

  final _WebViewVerticalScrollState _self;
  final $Res Function(_WebViewVerticalScrollState) _then;

/// Create a copy of WebViewVerticalScrollState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? direction = null,Object? value = null,Object? position = null,}) {
  return _then(_WebViewVerticalScrollState(
direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as WebviewVerticalScrollDirection,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
