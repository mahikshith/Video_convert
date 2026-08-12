// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gif_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GifOptions {
  Duration get start => throw _privateConstructorUsedError;
  Duration get end => throw _privateConstructorUsedError;
  int get fps => throw _privateConstructorUsedError;

  /// Create a copy of GifOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GifOptionsCopyWith<GifOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GifOptionsCopyWith<$Res> {
  factory $GifOptionsCopyWith(
    GifOptions value,
    $Res Function(GifOptions) then,
  ) = _$GifOptionsCopyWithImpl<$Res, GifOptions>;
  @useResult
  $Res call({Duration start, Duration end, int fps});
}

/// @nodoc
class _$GifOptionsCopyWithImpl<$Res, $Val extends GifOptions>
    implements $GifOptionsCopyWith<$Res> {
  _$GifOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GifOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = null, Object? end = null, Object? fps = null}) {
    return _then(
      _value.copyWith(
            start: null == start
                ? _value.start
                : start // ignore: cast_nullable_to_non_nullable
                      as Duration,
            end: null == end
                ? _value.end
                : end // ignore: cast_nullable_to_non_nullable
                      as Duration,
            fps: null == fps
                ? _value.fps
                : fps // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GifOptionsImplCopyWith<$Res>
    implements $GifOptionsCopyWith<$Res> {
  factory _$$GifOptionsImplCopyWith(
    _$GifOptionsImpl value,
    $Res Function(_$GifOptionsImpl) then,
  ) = __$$GifOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration start, Duration end, int fps});
}

/// @nodoc
class __$$GifOptionsImplCopyWithImpl<$Res>
    extends _$GifOptionsCopyWithImpl<$Res, _$GifOptionsImpl>
    implements _$$GifOptionsImplCopyWith<$Res> {
  __$$GifOptionsImplCopyWithImpl(
    _$GifOptionsImpl _value,
    $Res Function(_$GifOptionsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GifOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? start = null, Object? end = null, Object? fps = null}) {
    return _then(
      _$GifOptionsImpl(
        start: null == start
            ? _value.start
            : start // ignore: cast_nullable_to_non_nullable
                  as Duration,
        end: null == end
            ? _value.end
            : end // ignore: cast_nullable_to_non_nullable
                  as Duration,
        fps: null == fps
            ? _value.fps
            : fps // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GifOptionsImpl implements _GifOptions {
  const _$GifOptionsImpl({
    required this.start,
    required this.end,
    required this.fps,
  });

  @override
  final Duration start;
  @override
  final Duration end;
  @override
  final int fps;

  @override
  String toString() {
    return 'GifOptions(start: $start, end: $end, fps: $fps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GifOptionsImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.fps, fps) || other.fps == fps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end, fps);

  /// Create a copy of GifOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GifOptionsImplCopyWith<_$GifOptionsImpl> get copyWith =>
      __$$GifOptionsImplCopyWithImpl<_$GifOptionsImpl>(this, _$identity);
}

abstract class _GifOptions implements GifOptions {
  const factory _GifOptions({
    required final Duration start,
    required final Duration end,
    required final int fps,
  }) = _$GifOptionsImpl;

  @override
  Duration get start;
  @override
  Duration get end;
  @override
  int get fps;

  /// Create a copy of GifOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GifOptionsImplCopyWith<_$GifOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
