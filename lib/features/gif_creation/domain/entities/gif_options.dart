import 'package:freezed_annotation/freezed_annotation.dart';

part 'gif_options.freezed.dart';

@freezed
class GifOptions with _$GifOptions {
  const factory GifOptions({
    required Duration start,
    required Duration end,
    required int fps,
  }) = _GifOptions;
}
