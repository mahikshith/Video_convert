// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VideoFile {
  String get path => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get sizeBytes => throw _privateConstructorUsedError;
  String get extension => throw _privateConstructorUsedError;

  /// Create a copy of VideoFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoFileCopyWith<VideoFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoFileCopyWith<$Res> {
  factory $VideoFileCopyWith(VideoFile value, $Res Function(VideoFile) then) =
      _$VideoFileCopyWithImpl<$Res, VideoFile>;
  @useResult
  $Res call({String path, String name, int sizeBytes, String extension});
}

/// @nodoc
class _$VideoFileCopyWithImpl<$Res, $Val extends VideoFile>
    implements $VideoFileCopyWith<$Res> {
  _$VideoFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? name = null,
    Object? sizeBytes = null,
    Object? extension = null,
  }) {
    return _then(
      _value.copyWith(
            path: null == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            sizeBytes: null == sizeBytes
                ? _value.sizeBytes
                : sizeBytes // ignore: cast_nullable_to_non_nullable
                      as int,
            extension: null == extension
                ? _value.extension
                : extension // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VideoFileImplCopyWith<$Res>
    implements $VideoFileCopyWith<$Res> {
  factory _$$VideoFileImplCopyWith(
    _$VideoFileImpl value,
    $Res Function(_$VideoFileImpl) then,
  ) = __$$VideoFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, String name, int sizeBytes, String extension});
}

/// @nodoc
class __$$VideoFileImplCopyWithImpl<$Res>
    extends _$VideoFileCopyWithImpl<$Res, _$VideoFileImpl>
    implements _$$VideoFileImplCopyWith<$Res> {
  __$$VideoFileImplCopyWithImpl(
    _$VideoFileImpl _value,
    $Res Function(_$VideoFileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? name = null,
    Object? sizeBytes = null,
    Object? extension = null,
  }) {
    return _then(
      _$VideoFileImpl(
        path: null == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        sizeBytes: null == sizeBytes
            ? _value.sizeBytes
            : sizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
        extension: null == extension
            ? _value.extension
            : extension // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$VideoFileImpl implements _VideoFile {
  const _$VideoFileImpl({
    required this.path,
    required this.name,
    required this.sizeBytes,
    required this.extension,
  });

  @override
  final String path;
  @override
  final String name;
  @override
  final int sizeBytes;
  @override
  final String extension;

  @override
  String toString() {
    return 'VideoFile(path: $path, name: $name, sizeBytes: $sizeBytes, extension: $extension)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoFileImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            (identical(other.extension, extension) ||
                other.extension == extension));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, path, name, sizeBytes, extension);

  /// Create a copy of VideoFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoFileImplCopyWith<_$VideoFileImpl> get copyWith =>
      __$$VideoFileImplCopyWithImpl<_$VideoFileImpl>(this, _$identity);
}

abstract class _VideoFile implements VideoFile {
  const factory _VideoFile({
    required final String path,
    required final String name,
    required final int sizeBytes,
    required final String extension,
  }) = _$VideoFileImpl;

  @override
  String get path;
  @override
  String get name;
  @override
  int get sizeBytes;
  @override
  String get extension;

  /// Create a copy of VideoFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoFileImplCopyWith<_$VideoFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
