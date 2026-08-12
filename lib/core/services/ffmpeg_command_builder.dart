import 'package:video_converter_pro/features/compression/domain/entities/encoding_settings.dart';

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
}
