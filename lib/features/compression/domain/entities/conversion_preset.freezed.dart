// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_preset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ConversionPreset {
  Enum get preset => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CompressionPreset preset) compression,
    required TResult Function(DestinationPreset preset) destination,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CompressionPreset preset)? compression,
    TResult? Function(DestinationPreset preset)? destination,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CompressionPreset preset)? compression,
    TResult Function(DestinationPreset preset)? destination,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompressionSelection value) compression,
    required TResult Function(DestinationSelection value) destination,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompressionSelection value)? compression,
    TResult? Function(DestinationSelection value)? destination,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompressionSelection value)? compression,
    TResult Function(DestinationSelection value)? destination,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionPresetCopyWith<$Res> {
  factory $ConversionPresetCopyWith(
    ConversionPreset value,
    $Res Function(ConversionPreset) then,
  ) = _$ConversionPresetCopyWithImpl<$Res, ConversionPreset>;
}

/// @nodoc
class _$ConversionPresetCopyWithImpl<$Res, $Val extends ConversionPreset>
    implements $ConversionPresetCopyWith<$Res> {
  _$ConversionPresetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionPreset
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CompressionSelectionImplCopyWith<$Res> {
  factory _$$CompressionSelectionImplCopyWith(
    _$CompressionSelectionImpl value,
    $Res Function(_$CompressionSelectionImpl) then,
  ) = __$$CompressionSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CompressionPreset preset});
}

/// @nodoc
class __$$CompressionSelectionImplCopyWithImpl<$Res>
    extends _$ConversionPresetCopyWithImpl<$Res, _$CompressionSelectionImpl>
    implements _$$CompressionSelectionImplCopyWith<$Res> {
  __$$CompressionSelectionImplCopyWithImpl(
    _$CompressionSelectionImpl _value,
    $Res Function(_$CompressionSelectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversionPreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? preset = null}) {
    return _then(
      _$CompressionSelectionImpl(
        null == preset
            ? _value.preset
            : preset // ignore: cast_nullable_to_non_nullable
                  as CompressionPreset,
      ),
    );
  }
}

/// @nodoc

class _$CompressionSelectionImpl implements CompressionSelection {
  const _$CompressionSelectionImpl(this.preset);

  @override
  final CompressionPreset preset;

  @override
  String toString() {
    return 'ConversionPreset.compression(preset: $preset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompressionSelectionImpl &&
            (identical(other.preset, preset) || other.preset == preset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preset);

  /// Create a copy of ConversionPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompressionSelectionImplCopyWith<_$CompressionSelectionImpl>
  get copyWith =>
      __$$CompressionSelectionImplCopyWithImpl<_$CompressionSelectionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CompressionPreset preset) compression,
    required TResult Function(DestinationPreset preset) destination,
  }) {
    return compression(preset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CompressionPreset preset)? compression,
    TResult? Function(DestinationPreset preset)? destination,
  }) {
    return compression?.call(preset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CompressionPreset preset)? compression,
    TResult Function(DestinationPreset preset)? destination,
    required TResult orElse(),
  }) {
    if (compression != null) {
      return compression(preset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompressionSelection value) compression,
    required TResult Function(DestinationSelection value) destination,
  }) {
    return compression(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompressionSelection value)? compression,
    TResult? Function(DestinationSelection value)? destination,
  }) {
    return compression?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompressionSelection value)? compression,
    TResult Function(DestinationSelection value)? destination,
    required TResult orElse(),
  }) {
    if (compression != null) {
      return compression(this);
    }
    return orElse();
  }
}

abstract class CompressionSelection implements ConversionPreset {
  const factory CompressionSelection(final CompressionPreset preset) =
      _$CompressionSelectionImpl;

  @override
  CompressionPreset get preset;

  /// Create a copy of ConversionPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompressionSelectionImplCopyWith<_$CompressionSelectionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DestinationSelectionImplCopyWith<$Res> {
  factory _$$DestinationSelectionImplCopyWith(
    _$DestinationSelectionImpl value,
    $Res Function(_$DestinationSelectionImpl) then,
  ) = __$$DestinationSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DestinationPreset preset});
}

/// @nodoc
class __$$DestinationSelectionImplCopyWithImpl<$Res>
    extends _$ConversionPresetCopyWithImpl<$Res, _$DestinationSelectionImpl>
    implements _$$DestinationSelectionImplCopyWith<$Res> {
  __$$DestinationSelectionImplCopyWithImpl(
    _$DestinationSelectionImpl _value,
    $Res Function(_$DestinationSelectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversionPreset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? preset = null}) {
    return _then(
      _$DestinationSelectionImpl(
        null == preset
            ? _value.preset
            : preset // ignore: cast_nullable_to_non_nullable
                  as DestinationPreset,
      ),
    );
  }
}

/// @nodoc

class _$DestinationSelectionImpl implements DestinationSelection {
  const _$DestinationSelectionImpl(this.preset);

  @override
  final DestinationPreset preset;

  @override
  String toString() {
    return 'ConversionPreset.destination(preset: $preset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DestinationSelectionImpl &&
            (identical(other.preset, preset) || other.preset == preset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preset);

  /// Create a copy of ConversionPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DestinationSelectionImplCopyWith<_$DestinationSelectionImpl>
  get copyWith =>
      __$$DestinationSelectionImplCopyWithImpl<_$DestinationSelectionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CompressionPreset preset) compression,
    required TResult Function(DestinationPreset preset) destination,
  }) {
    return destination(preset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CompressionPreset preset)? compression,
    TResult? Function(DestinationPreset preset)? destination,
  }) {
    return destination?.call(preset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CompressionPreset preset)? compression,
    TResult Function(DestinationPreset preset)? destination,
    required TResult orElse(),
  }) {
    if (destination != null) {
      return destination(preset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompressionSelection value) compression,
    required TResult Function(DestinationSelection value) destination,
  }) {
    return destination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompressionSelection value)? compression,
    TResult? Function(DestinationSelection value)? destination,
  }) {
    return destination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompressionSelection value)? compression,
    TResult Function(DestinationSelection value)? destination,
    required TResult orElse(),
  }) {
    if (destination != null) {
      return destination(this);
    }
    return orElse();
  }
}

abstract class DestinationSelection implements ConversionPreset {
  const factory DestinationSelection(final DestinationPreset preset) =
      _$DestinationSelectionImpl;

  @override
  DestinationPreset get preset;

  /// Create a copy of ConversionPreset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DestinationSelectionImplCopyWith<_$DestinationSelectionImpl>
  get copyWith => throw _privateConstructorUsedError;
}
