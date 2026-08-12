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
    OutputFormat format = OutputFormat.mp4,
    EncodingSettings? settings,
  }) {
    final args = <String>['-y', '-i', inputPath];

    final maxWidth = settings?.maxWidth;
    final maxHeight = settings?.maxHeight;
    if (maxWidth != null && maxHeight != null) {
      // force_divisible_by=2 keeps both scaled dimensions even; H.264 and
      // VP9 with yuv420p reject an odd width or height, which
      // force_original_aspect_ratio=decrease can otherwise produce.
      args.addAll([
        '-vf',
        "scale='min($maxWidth,iw)':'min($maxHeight,ih)':"
            'force_original_aspect_ratio=decrease:force_divisible_by=2',
      ]);
    }

    // WebM only accepts VP8/VP9/AV1 video with Vorbis/Opus audio; muxing
    // H.264/AAC into it fails outright.
    final isWebm = format == OutputFormat.webm;
    if (isWebm) {
      args.addAll([
        '-c:v', 'libvpx-vp9',
        // libvpx-vp9 defaults are tuned for offline desktop encoding and are
        // an order of magnitude too slow on a phone. row-mt spreads a frame
        // across cores, and deadline/cpu-used trade a little compression
        // efficiency for the speed this has to have on mobile.
        '-row-mt', '1',
        '-deadline', 'good',
        '-cpu-used', '4',
      ]);
    } else {
      // 'medium' is a desktop default; on mobile it blows past the PRD's
      // 30s average conversion target. 'veryfast' is several times quicker
      // for a modest size increase at the same CRF.
      args.addAll(['-c:v', 'libx264', '-preset', 'veryfast']);
    }

    final videoBitrateKbps = settings?.videoBitrateKbps;
    final crf = settings?.crf;
    if (videoBitrateKbps != null) {
      args.addAll(['-b:v', '${videoBitrateKbps}k']);
    } else if (crf != null) {
      // libvpx-vp9 only honours -crf in constant-quality mode, which needs
      // an explicit zero target bitrate.
      if (isWebm) {
        args.addAll(['-b:v', '0']);
      }
      args.addAll(['-crf', '$crf']);
    }

    args.addAll(['-c:a', isWebm ? 'libopus' : 'aac']);
    final audioBitrateKbps = settings?.audioBitrateKbps;
    if (audioBitrateKbps != null) {
      args.addAll(['-b:a', '${audioBitrateKbps}k']);
    }

    // Move the moov atom to the front so a shared clip starts playing before
    // it has fully downloaded. MP4/MOV only — the other containers don't
    // have this problem.
    if (format == OutputFormat.mp4 || format == OutputFormat.mov) {
      args.addAll(['-movflags', '+faststart']);
    }

    args.add(outputPath);
    return args;
  }

  List<String> buildAudioExtractCommand({
    required String inputPath,
    required String outputPath,
    required OutputFormat format,
  }) {
    // -map 0:a:0 pins the first audio stream: a file with several audio
    // tracks would otherwise let FFmpeg's default stream selection pick one
    // we didn't intend.
    final args = <String>['-y', '-i', inputPath, '-vn', '-map', '0:a:0'];

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

    // Without a generated palette, FFmpeg falls back to a generic 256-colour
    // table: visibly banded output that is also usually *larger* than a
    // palettised GIF. split/palettegen/paletteuse does both passes in one
    // command. min(480,iw) avoids pointlessly upscaling an already-small clip.
    args.addAll([
      '-filter_complex',
      "fps=${options.fps},scale='min(480,iw)':-1:flags=lanczos,"
          'split[s0][s1];[s0]palettegen=stats_mode=diff[p];'
          '[s1][p]paletteuse=dither=bayer:bayer_scale=5',
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
