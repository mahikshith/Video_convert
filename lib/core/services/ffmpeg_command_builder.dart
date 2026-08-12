import 'package:video_converter_pro/features/compression/domain/entities/encoding_settings.dart';
import 'package:video_converter_pro/features/gif_creation/domain/entities/gif_options.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/output_format.dart';

/// Builds argument lists for FFmpegKit's `executeWithArgumentsAsync`.
///
/// Arguments are returned as a list (not a shell string) so paths with
/// spaces or special characters don't need manual escaping.
class FfmpegCommandBuilder {
  const FfmpegCommandBuilder();

  List<String> buildConvertCommand({
    required String inputPath,
    required String outputPath,
    EncodingSettings? settings,
  }) {
    final args = <String>['-y', '-i', inputPath];

    final maxWidth = settings?.maxWidth;
    final maxHeight = settings?.maxHeight;
    if (maxWidth != null && maxHeight != null) {
      args.addAll([
        '-vf',
        "scale='min($maxWidth,iw)':'min($maxHeight,ih)':"
            'force_original_aspect_ratio=decrease',
      ]);
    }

    args.addAll(['-c:v', 'libx264', '-preset', 'medium']);

    final videoBitrateKbps = settings?.videoBitrateKbps;
    final crf = settings?.crf;
    if (videoBitrateKbps != null) {
      args.addAll(['-b:v', '${videoBitrateKbps}k']);
    } else if (crf != null) {
      args.addAll(['-crf', '$crf']);
    }

    args.addAll(['-c:a', 'aac']);
    final audioBitrateKbps = settings?.audioBitrateKbps;
    if (audioBitrateKbps != null) {
      args.addAll(['-b:a', '${audioBitrateKbps}k']);
    }

    args.add(outputPath);
    return args;
  }

  List<String> buildAudioExtractCommand({
    required String inputPath,
    required String outputPath,
    required OutputFormat format,
  }) {
    final args = <String>['-y', '-i', inputPath, '-vn'];

    switch (format) {
      case OutputFormat.mp3:
        args.addAll(['-c:a', 'libmp3lame', '-b:a', '192k']);
      case OutputFormat.aac:
        args.addAll(['-c:a', 'aac', '-b:a', '192k']);
      case OutputFormat.wav:
        args.addAll(['-c:a', 'pcm_s16le']);
      case OutputFormat.mp4:
      case OutputFormat.mov:
      case OutputFormat.mkv:
      case OutputFormat.webm:
      case OutputFormat.gif:
        throw ArgumentError.value(format, 'format', 'Not an audio format');
    }

    args.add(outputPath);
    return args;
  }

  List<String> buildGifCommand({
    required String inputPath,
    required String outputPath,
    required GifOptions options,
  }) {
    final args = <String>['-y'];

    if (options.start > Duration.zero) {
      args.addAll(['-ss', _formatTimestamp(options.start)]);
    }
    args.addAll(['-i', inputPath]);

    final clipDuration = options.end - options.start;
    if (clipDuration > Duration.zero) {
      args.addAll(['-t', _formatTimestamp(clipDuration)]);
    }

    args.addAll([
      '-vf',
      'fps=${options.fps},scale=480:-1:flags=lanczos',
      '-loop',
      '0',
      outputPath,
    ]);

    return args;
  }

  String _formatTimestamp(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    final millis = (duration.inMilliseconds % 1000).toString().padLeft(3, '0');
    return '$hours:$minutes:$seconds.$millis';
  }
}
