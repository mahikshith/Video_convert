// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ConversionUiState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(ConversionProgress progress) inProgress,
    required TResult Function(ConversionResult result) completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ConversionProgress progress)? inProgress,
    TResult? Function(ConversionResult result)? completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ConversionProgress progress)? inProgress,
    TResult Function(ConversionResult result)? completed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversionIdle value) idle,
    required TResult Function(ConversionInProgress value) inProgress,
    required TResult Function(ConversionCompleted value) completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversionIdle value)? idle,
    TResult? Function(ConversionInProgress value)? inProgress,
    TResult? Function(ConversionCompleted value)? completed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversionIdle value)? idle,
    TResult Function(ConversionInProgress value)? inProgress,
    TResult Function(ConversionCompleted value)? completed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionUiStateCopyWith<$Res> {
  factory $ConversionUiStateCopyWith(
    ConversionUiState value,
    $Res Function(ConversionUiState) then,
  ) = _$ConversionUiStateCopyWithImpl<$Res, ConversionUiState>;
}

/// @nodoc
class _$ConversionUiStateCopyWithImpl<$Res, $Val extends ConversionUiState>
    implements $ConversionUiStateCopyWith<$Res> {
  _$ConversionUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConversionIdleImplCopyWith<$Res> {
  factory _$$ConversionIdleImplCopyWith(
    _$ConversionIdleImpl value,
    $Res Function(_$ConversionIdleImpl) then,
  ) = __$$ConversionIdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConversionIdleImplCopyWithImpl<$Res>
    extends _$ConversionUiStateCopyWithImpl<$Res, _$ConversionIdleImpl>
    implements _$$ConversionIdleImplCopyWith<$Res> {
  __$$ConversionIdleImplCopyWithImpl(
    _$ConversionIdleImpl _value,
    $Res Function(_$ConversionIdleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConversionIdleImpl implements ConversionIdle {
  const _$ConversionIdleImpl();

  @override
  String toString() {
    return 'ConversionUiState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConversionIdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(ConversionProgress progress) inProgress,
    required TResult Function(ConversionResult result) completed,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ConversionProgress progress)? inProgress,
    TResult? Function(ConversionResult result)? completed,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ConversionProgress progress)? inProgress,
    TResult Function(ConversionResult result)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversionIdle value) idle,
    required TResult Function(ConversionInProgress value) inProgress,
    required TResult Function(ConversionCompleted value) completed,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversionIdle value)? idle,
    TResult? Function(ConversionInProgress value)? inProgress,
    TResult? Function(ConversionCompleted value)? completed,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversionIdle value)? idle,
    TResult Function(ConversionInProgress value)? inProgress,
    TResult Function(ConversionCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ConversionIdle implements ConversionUiState {
  const factory ConversionIdle() = _$ConversionIdleImpl;
}

/// @nodoc
abstract class _$$ConversionInProgressImplCopyWith<$Res> {
  factory _$$ConversionInProgressImplCopyWith(
    _$ConversionInProgressImpl value,
    $Res Function(_$ConversionInProgressImpl) then,
  ) = __$$ConversionInProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConversionProgress progress});

  $ConversionProgressCopyWith<$Res> get progress;
}

/// @nodoc
class __$$ConversionInProgressImplCopyWithImpl<$Res>
    extends _$ConversionUiStateCopyWithImpl<$Res, _$ConversionInProgressImpl>
    implements _$$ConversionInProgressImplCopyWith<$Res> {
  __$$ConversionInProgressImplCopyWithImpl(
    _$ConversionInProgressImpl _value,
    $Res Function(_$ConversionInProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? progress = null}) {
    return _then(
      _$ConversionInProgressImpl(
        null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as ConversionProgress,
      ),
    );
  }

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversionProgressCopyWith<$Res> get progress {
    return $ConversionProgressCopyWith<$Res>(_value.progress, (value) {
      return _then(_value.copyWith(progress: value));
    });
  }
}

/// @nodoc

class _$ConversionInProgressImpl implements ConversionInProgress {
  const _$ConversionInProgressImpl(this.progress);

  @override
  final ConversionProgress progress;

  @override
  String toString() {
    return 'ConversionUiState.inProgress(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionInProgressImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionInProgressImplCopyWith<_$ConversionInProgressImpl>
  get copyWith =>
      __$$ConversionInProgressImplCopyWithImpl<_$ConversionInProgressImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(ConversionProgress progress) inProgress,
    required TResult Function(ConversionResult result) completed,
  }) {
    return inProgress(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ConversionProgress progress)? inProgress,
    TResult? Function(ConversionResult result)? completed,
  }) {
    return inProgress?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ConversionProgress progress)? inProgress,
    TResult Function(ConversionResult result)? completed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversionIdle value) idle,
    required TResult Function(ConversionInProgress value) inProgress,
    required TResult Function(ConversionCompleted value) completed,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversionIdle value)? idle,
    TResult? Function(ConversionInProgress value)? inProgress,
    TResult? Function(ConversionCompleted value)? completed,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversionIdle value)? idle,
    TResult Function(ConversionInProgress value)? inProgress,
    TResult Function(ConversionCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class ConversionInProgress implements ConversionUiState {
  const factory ConversionInProgress(final ConversionProgress progress) =
      _$ConversionInProgressImpl;

  ConversionProgress get progress;

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionInProgressImplCopyWith<_$ConversionInProgressImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConversionCompletedImplCopyWith<$Res> {
  factory _$$ConversionCompletedImplCopyWith(
    _$ConversionCompletedImpl value,
    $Res Function(_$ConversionCompletedImpl) then,
  ) = __$$ConversionCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ConversionResult result});

  $ConversionResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$ConversionCompletedImplCopyWithImpl<$Res>
    extends _$ConversionUiStateCopyWithImpl<$Res, _$ConversionCompletedImpl>
    implements _$$ConversionCompletedImplCopyWith<$Res> {
  __$$ConversionCompletedImplCopyWithImpl(
    _$ConversionCompletedImpl _value,
    $Res Function(_$ConversionCompletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? result = null}) {
    return _then(
      _$ConversionCompletedImpl(
        null == result
            ? _value.result
            : result // ignore: cast_nullable_to_non_nullable
                  as ConversionResult,
      ),
    );
  }

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConversionResultCopyWith<$Res> get result {
    return $ConversionResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }
}

/// @nodoc

class _$ConversionCompletedImpl implements ConversionCompleted {
  const _$ConversionCompletedImpl(this.result);

  @override
  final ConversionResult result;

  @override
  String toString() {
    return 'ConversionUiState.completed(result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversionCompletedImpl &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversionCompletedImplCopyWith<_$ConversionCompletedImpl> get copyWith =>
      __$$ConversionCompletedImplCopyWithImpl<_$ConversionCompletedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(ConversionProgress progress) inProgress,
    required TResult Function(ConversionResult result) completed,
  }) {
    return completed(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ConversionProgress progress)? inProgress,
    TResult? Function(ConversionResult result)? completed,
  }) {
    return completed?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ConversionProgress progress)? inProgress,
    TResult Function(ConversionResult result)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConversionIdle value) idle,
    required TResult Function(ConversionInProgress value) inProgress,
    required TResult Function(ConversionCompleted value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConversionIdle value)? idle,
    TResult? Function(ConversionInProgress value)? inProgress,
    TResult? Function(ConversionCompleted value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConversionIdle value)? idle,
    TResult Function(ConversionInProgress value)? inProgress,
    TResult Function(ConversionCompleted value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class ConversionCompleted implements ConversionUiState {
  const factory ConversionCompleted(final ConversionResult result) =
      _$ConversionCompletedImpl;

  ConversionResult get result;

  /// Create a copy of ConversionUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversionCompletedImplCopyWith<_$ConversionCompletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
