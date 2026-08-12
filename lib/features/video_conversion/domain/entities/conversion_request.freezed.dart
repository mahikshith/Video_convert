// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ConversionRequest {
  VideoFile get input => throw _privateConstructorUsedError;
  OutputFormat get outputFormat => throw _privateConstructorUsedError;
  String get outputPath => throw _privateConstructorUsedError;

  /// Create a copy of ConversionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversionRequestCopyWith<ConversionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionRequestCopyWith<$Res> {
  factory $ConversionRequestCopyWith(
    ConversionRequest value,
    $Res Function(ConversionRequest) then,
  ) = _$ConversionRequestCopyWithImpl<$Res, ConversionRequest>;
  @useResult
  $Res call({VideoFile input, OutputFormat outputFormat, String outputPath});

  $VideoFileCopyWith<$Res> get input;
}

/// @nodoc
class _$ConversionRequestCopyWithImpl<$Res, $Val extends ConversionRequest>
    implements $ConversionRequestCopyWith<$Res> {
  _$ConversionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? outputFormat = null,
    Object? outputPath = null,
  }) {
    return _then(
      _value.copyWith(
            input: null == input
                ? _value.input
                : input // ignore: cast_nullable_to_non_nullable
                      as VideoFile,
            outputFormat: null == outputFormat
                ? _value.outputFormat
                : outputFormat // ignore: cast_nullable_to_non_nullable
                      as OutputFormat,
            outputPath: null == outputPath
                ? _value.outputPath
                : outputPath // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of ConversionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoFileCopyWith<$Res> get input {
    return $VideoFileCopyWith<$Res>(_value.input, (value) {
      return _then(_value.copyWith(input: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConversionRequestImplCopyWith<$Res>
    implements $ConversionRequestCopyWith<$Res> {
  factory _$$ConversionRequestImplCopyWith(
    _$ConversionRequestImpl value,
    $Res Function(_$ConversionRequestImpl) then,
  ) = __$$ConversionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VideoFile input, OutputFormat outputFormat, String outputPath});

  @override
  $VideoFileCopyWith<$Res> get input;
}

/// @nodoc
class __$$ConversionRequestImplCopyWithImpl<$Res>
    extends _$ConversionRequestCopyWithImpl<$Res, _$ConversionRequestImpl>
    implements _$$ConversionRequestImplCopyWith<$Res> {
  __$$ConversionRequestImplCopyWithImpl(
    _$ConversionRequestImpl _value,
    $Res Function(_$ConversionRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversionRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? outputFormat = null,
    Object? outputPath = null,
  }) {
    return _then(
      _$ConversionRequestImpl(
        input: null == input
            ? _value.input
            : input // ignore: cast_nullable_to_non_nullable
                  as VideoFile,
        outputFormat: null == outputFormat
            ? _value.outputFormat
            : outputFormat // ignore: cast_nullable_to_non_nullable
                  as OutputFormat,
        outputPath: null == outputPath
            ? _value.outputPath
            : outputPath // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ConversionRequestImpl implements _ConversionRequest {
  const _$ConversionRequestImpl({
    required this.input,
    required this.outputFormat,
    required this.outputPath,
  });

  @override
  final VideoFile input;
  @override
  final OutputFormat outputFormat;
  @override
  final String outputPath;

  @override
  String toString() {
    return 'ConversionRequest(input: $input, outputFormat: $outputFormat, outputPath: $outputPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionRequestImpl &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.outputFormat, outputFormat) ||
                other.outputFormat == outputFormat) &&
            (identical(other.outputPath, outputPath) ||
                other.outputPath == outputPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input, outputFormat, outputPath);

  /// Create a copy of ConversionRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionRequestImplCopyWith<_$ConversionRequestImpl> get copyWith =>
      __$$ConversionRequestImplCopyWithImpl<_$ConversionRequestImpl>(
        this,
        _$identity,
      );
}

abstract class _ConversionRequest implements ConversionRequest {
  const factory _ConversionRequest({
    required final VideoFile input,
    required final OutputFormat outputFormat,
    required final String outputPath,
  }) = _$ConversionRequestImpl;

  @override
  VideoFile get input;
  @override
  OutputFormat get outputFormat;
  @override
  String get outputPath;

  /// Create a copy of ConversionRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionRequestImplCopyWith<_$ConversionRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
