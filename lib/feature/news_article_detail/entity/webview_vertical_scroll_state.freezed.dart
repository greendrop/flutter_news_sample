// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webview_vertical_scroll_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WebViewVerticalScrollState {
  WebviewVerticalScrollDirection get direction =>
      throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebViewVerticalScrollStateCopyWith<WebViewVerticalScrollState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebViewVerticalScrollStateCopyWith<$Res> {
  factory $WebViewVerticalScrollStateCopyWith(WebViewVerticalScrollState value,
          $Res Function(WebViewVerticalScrollState) then) =
      _$WebViewVerticalScrollStateCopyWithImpl<$Res,
          WebViewVerticalScrollState>;
  @useResult
  $Res call(
      {WebviewVerticalScrollDirection direction, int value, int position});
}

/// @nodoc
class _$WebViewVerticalScrollStateCopyWithImpl<$Res,
        $Val extends WebViewVerticalScrollState>
    implements $WebViewVerticalScrollStateCopyWith<$Res> {
  _$WebViewVerticalScrollStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
    Object? value = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as WebviewVerticalScrollDirection,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebViewVerticalScrollStateImplCopyWith<$Res>
    implements $WebViewVerticalScrollStateCopyWith<$Res> {
  factory _$$WebViewVerticalScrollStateImplCopyWith(
          _$WebViewVerticalScrollStateImpl value,
          $Res Function(_$WebViewVerticalScrollStateImpl) then) =
      __$$WebViewVerticalScrollStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WebviewVerticalScrollDirection direction, int value, int position});
}

/// @nodoc
class __$$WebViewVerticalScrollStateImplCopyWithImpl<$Res>
    extends _$WebViewVerticalScrollStateCopyWithImpl<$Res,
        _$WebViewVerticalScrollStateImpl>
    implements _$$WebViewVerticalScrollStateImplCopyWith<$Res> {
  __$$WebViewVerticalScrollStateImplCopyWithImpl(
      _$WebViewVerticalScrollStateImpl _value,
      $Res Function(_$WebViewVerticalScrollStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
    Object? value = null,
    Object? position = null,
  }) {
    return _then(_$WebViewVerticalScrollStateImpl(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as WebviewVerticalScrollDirection,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WebViewVerticalScrollStateImpl extends _WebViewVerticalScrollState {
  _$WebViewVerticalScrollStateImpl(
      {this.direction = WebviewVerticalScrollDirection.up,
      this.value = 0,
      this.position = 0})
      : super._();

  @override
  @JsonKey()
  final WebviewVerticalScrollDirection direction;
  @override
  @JsonKey()
  final int value;
  @override
  @JsonKey()
  final int position;

  @override
  String toString() {
    return 'WebViewVerticalScrollState(direction: $direction, value: $value, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebViewVerticalScrollStateImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, direction, value, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebViewVerticalScrollStateImplCopyWith<_$WebViewVerticalScrollStateImpl>
      get copyWith => __$$WebViewVerticalScrollStateImplCopyWithImpl<
          _$WebViewVerticalScrollStateImpl>(this, _$identity);
}

abstract class _WebViewVerticalScrollState extends WebViewVerticalScrollState {
  factory _WebViewVerticalScrollState(
      {final WebviewVerticalScrollDirection direction,
      final int value,
      final int position}) = _$WebViewVerticalScrollStateImpl;
  _WebViewVerticalScrollState._() : super._();

  @override
  WebviewVerticalScrollDirection get direction;
  @override
  int get value;
  @override
  int get position;
  @override
  @JsonKey(ignore: true)
  _$$WebViewVerticalScrollStateImplCopyWith<_$WebViewVerticalScrollStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
