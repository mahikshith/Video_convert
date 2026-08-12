import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_progress.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/conversion_result.dart';

part 'conversion_ui_state.freezed.dart';

@freezed
sealed class ConversionUiState with _$ConversionUiState {
  const factory ConversionUiState.idle() = ConversionIdle;
  const factory ConversionUiState.inProgress(ConversionProgress progress) =
      ConversionInProgress;
  const factory ConversionUiState.completed(ConversionResult result) =
      ConversionCompleted;
}
