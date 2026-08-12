// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ConversionResult {
  String get outputPath => throw _privateConstructorUsedError;
  int get inputSizeBytes => throw _privateConstructorUsedError;
  int get outputSizeBytes => throw _privateConstructorUsedError;
  Duration get processingTime => throw _privateConstructorUsedError;

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversionResultCopyWith<ConversionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionResultCopyWith<$Res> {
  factory $ConversionResultCopyWith(
    ConversionResult value,
    $Res Function(ConversionResult) then,
  ) = _$ConversionResultCopyWithImpl<$Res, ConversionResult>;
  @useResult
  $Res call({
    String outputPath,
    int inputSizeBytes,
    int outputSizeBytes,
    Duration processingTime,
  });
}

/// @nodoc
class _$ConversionResultCopyWithImpl<$Res, $Val extends ConversionResult>
    implements $ConversionResultCopyWith<$Res> {
  _$ConversionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputPath = null,
    Object? inputSizeBytes = null,
    Object? outputSizeBytes = null,
    Object? processingTime = null,
  }) {
    return _then(
      _value.copyWith(
            outputPath: null == outputPath
                ? _value.outputPath
                : outputPath // ignore: cast_nullable_to_non_nullable
                      as String,
            inputSizeBytes: null == inputSizeBytes
                ? _value.inputSizeBytes
                : inputSizeBytes // ignore: cast_nullable_to_non_nullable
                      as int,
            outputSizeBytes: null == outputSizeBytes
                ? _value.outputSizeBytes
                : outputSizeBytes // ignore: cast_nullable_to_non_nullable
                      as int,
            processingTime: null == processingTime
                ? _value.processingTime
                : processingTime // ignore: cast_nullable_to_non_nullable
                      as Duration,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConversionResultImplCopyWith<$Res>
    implements $ConversionResultCopyWith<$Res> {
  factory _$$ConversionResultImplCopyWith(
    _$ConversionResultImpl value,
    $Res Function(_$ConversionResultImpl) then,
  ) = __$$ConversionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String outputPath,
    int inputSizeBytes,
    int outputSizeBytes,
    Duration processingTime,
  });
}

/// @nodoc
class __$$ConversionResultImplCopyWithImpl<$Res>
    extends _$ConversionResultCopyWithImpl<$Res, _$ConversionResultImpl>
    implements _$$ConversionResultImplCopyWith<$Res> {
  __$$ConversionResultImplCopyWithImpl(
    _$ConversionResultImpl _value,
    $Res Function(_$ConversionResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outputPath = null,
    Object? inputSizeBytes = null,
    Object? outputSizeBytes = null,
    Object? processingTime = null,
  }) {
    return _then(
      _$ConversionResultImpl(
        outputPath: null == outputPath
            ? _value.outputPath
            : outputPath // ignore: cast_nullable_to_non_nullable
                  as String,
        inputSizeBytes: null == inputSizeBytes
            ? _value.inputSizeBytes
            : inputSizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
        outputSizeBytes: null == outputSizeBytes
            ? _value.outputSizeBytes
            : outputSizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
        processingTime: null == processingTime
            ? _value.processingTime
            : processingTime // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc

class _$ConversionResultImpl implements _ConversionResult {
  const _$ConversionResultImpl({
    required this.outputPath,
    required this.inputSizeBytes,
    required this.outputSizeBytes,
    required this.processingTime,
  });

  @override
  final String outputPath;
  @override
  final int inputSizeBytes;
  @override
  final int outputSizeBytes;
  @override
  final Duration processingTime;

  @override
  String toString() {
    return 'ConversionResult(outputPath: $outputPath, inputSizeBytes: $inputSizeBytes, outputSizeBytes: $outputSizeBytes, processingTime: $processingTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionResultImpl &&
            (identical(other.outputPath, outputPath) ||
                other.outputPath == outputPath) &&
            (identical(other.inputSizeBytes, inputSizeBytes) ||
                other.inputSizeBytes == inputSizeBytes) &&
            (identical(other.outputSizeBytes, outputSizeBytes) ||
                other.outputSizeBytes == outputSizeBytes) &&
            (identical(other.processingTime, processingTime) ||
                other.processingTime == processingTime));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    outputPath,
    inputSizeBytes,
    outputSizeBytes,
    processingTime,
  );

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionResultImplCopyWith<_$ConversionResultImpl> get copyWith =>
      __$$ConversionResultImplCopyWithImpl<_$ConversionResultImpl>(
        this,
        _$identity,
      );
}

abstract class _ConversionResult implements ConversionResult {
  const factory _ConversionResult({
    required final String outputPath,
    required final int inputSizeBytes,
    required final int outputSizeBytes,
    required final Duration processingTime,
  }) = _$ConversionResultImpl;

  @override
  String get outputPath;
  @override
  int get inputSizeBytes;
  @override
  int get outputSizeBytes;
  @override
  Duration get processingTime;

  /// Create a copy of ConversionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionResultImplCopyWith<_$ConversionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
