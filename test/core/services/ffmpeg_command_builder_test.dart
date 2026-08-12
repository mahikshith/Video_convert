import 'package:flutter_test/flutter_test.dart';
import 'package:video_converter_pro/core/services/ffmpeg_command_builder.dart';
import 'package:video_converter_pro/features/compression/domain/entities/encoding_settings.dart';
import 'package:video_converter_pro/features/gif_creation/domain/entities/gif_options.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/output_format.dart';

void main() {
  group('FfmpegCommandBuilder', () {
    const builder = FfmpegCommandBuilder();

    test('buildConvertCommand includes input and output paths', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp4',
      );

      expect(args, contains('/tmp/input.mov'));
      expect(args.last, '/tmp/output.mp4');
    });

    test('buildConvertCommand overwrites existing output files', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp4',
      );

      expect(args.first, '-y');
    });

    test('buildConvertCommand uses H.264 video and AAC audio codecs', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp4',
      );

      expect(args, containsAllInOrder(['-c:v', 'libx264']));
      expect(args, containsAllInOrder(['-c:a', 'aac']));
    });

    test('applies a scale filter when max dimensions are given', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp4',
        settings: const EncodingSettings(
          maxWidth: 1280,
          maxHeight: 720,
          audioBitrateKbps: 128,
        ),
      );

      expect(args, contains('-vf'));
      final filterIndex = args.indexOf('-vf') + 1;
      expect(args[filterIndex], contains('1280'));
      expect(args[filterIndex], contains('720'));
    });

    test('uses a fixed video bitrate when provided', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp4',
        settings: const EncodingSettings(
          videoBitrateKbps: 1500,
          audioBitrateKbps: 128,
        ),
      );

      expect(args, containsAllInOrder(['-b:v', '1500k']));
      expect(args, isNot(contains('-crf')));
    });

    test('uses CRF when no fixed bitrate is given', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp4',
        settings: const EncodingSettings(
          audioBitrateKbps: 128,
          crf: 24,
        ),
      );

      expect(args, containsAllInOrder(['-crf', '24']));
      expect(args, isNot(contains('-b:v')));
    });

    test('uses a mobile-appropriate x264 preset', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp4',
      );

      expect(args, containsAllInOrder(['-preset', 'veryfast']));
    });

    test('enables faststart for mp4 so shared clips stream', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp4',
      );

      expect(args, containsAllInOrder(['-movflags', '+faststart']));
    });

    test('does not set faststart on containers that lack a moov atom', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mkv',
        format: OutputFormat.mkv,
      );

      expect(args, isNot(contains('-movflags')));
    });

    test('webm uses VP9/Opus with multithreaded encoding enabled', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.webm',
        format: OutputFormat.webm,
      );

      expect(args, containsAllInOrder(['-c:v', 'libvpx-vp9']));
      expect(args, containsAllInOrder(['-c:a', 'libopus']));
      expect(args, containsAllInOrder(['-row-mt', '1']));
      expect(args, isNot(contains('libx264')));
    });

    test('webm CRF mode sets the zero target bitrate VP9 requires', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.webm',
        format: OutputFormat.webm,
        settings: const EncodingSettings(audioBitrateKbps: 128, crf: 24),
      );

      expect(args, containsAllInOrder(['-b:v', '0']));
      expect(args, containsAllInOrder(['-crf', '24']));
    });

    test('scale filter keeps dimensions even for yuv420p', () {
      final args = builder.buildConvertCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp4',
        settings: const EncodingSettings(
          maxWidth: 1280,
          maxHeight: 720,
          audioBitrateKbps: 128,
        ),
      );

      final filter = args[args.indexOf('-vf') + 1];
      expect(filter, contains('force_divisible_by=2'));
    });
  });

  group('FfmpegCommandBuilder.buildAudioExtractCommand', () {
    const builder = FfmpegCommandBuilder();

    test('drops video with -vn', () {
      final args = builder.buildAudioExtractCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp3',
        format: OutputFormat.mp3,
      );

      expect(args, contains('-vn'));
    });

    test('pins the first audio stream', () {
      final args = builder.buildAudioExtractCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp3',
        format: OutputFormat.mp3,
      );

      expect(args, containsAllInOrder(['-map', '0:a:0']));
    });

    test('uses libmp3lame for mp3', () {
      final args = builder.buildAudioExtractCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.mp3',
        format: OutputFormat.mp3,
      );

      expect(args, containsAllInOrder(['-c:a', 'libmp3lame']));
    });

    test('uses pcm_s16le for wav (no bitrate flag)', () {
      final args = builder.buildAudioExtractCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.wav',
        format: OutputFormat.wav,
      );

      expect(args, containsAllInOrder(['-c:a', 'pcm_s16le']));
      expect(args, isNot(contains('-b:a')));
    });

    test('rejects a non-audio format', () {
      expect(
        () => builder.buildAudioExtractCommand(
          inputPath: '/tmp/input.mov',
          outputPath: '/tmp/output.mp4',
          format: OutputFormat.mp4,
        ),
        throwsArgumentError,
      );
    });
  });

  group('FfmpegCommandBuilder.buildGifCommand', () {
    const builder = FfmpegCommandBuilder();

    test('includes fps filter and loop flag', () {
      final args = builder.buildGifCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.gif',
        options: const GifOptions(
          start: Duration.zero,
          end: Duration(seconds: 5),
          fps: 15,
        ),
      );

      expect(args, contains('-filter_complex'));
      final filterIndex = args.indexOf('-filter_complex') + 1;
      expect(args[filterIndex], contains('fps=15'));
      expect(args, containsAllInOrder(['-loop', '0']));
    });

    test('generates a palette rather than using the default colour table', () {
      final args = builder.buildGifCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.gif',
        options: const GifOptions(
          start: Duration.zero,
          end: Duration(seconds: 5),
          fps: 12,
        ),
      );

      final filter = args[args.indexOf('-filter_complex') + 1];
      expect(filter, contains('palettegen'));
      expect(filter, contains('paletteuse'));
    });

    test('does not upscale an input narrower than the target width', () {
      final args = builder.buildGifCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.gif',
        options: const GifOptions(
          start: Duration.zero,
          end: Duration(seconds: 5),
          fps: 12,
        ),
      );

      final filter = args[args.indexOf('-filter_complex') + 1];
      expect(filter, contains("scale='min(480,iw)'"));
    });

    test('omits -ss when start is zero', () {
      final args = builder.buildGifCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.gif',
        options: const GifOptions(
          start: Duration.zero,
          end: Duration(seconds: 5),
          fps: 12,
        ),
      );

      expect(args, isNot(contains('-ss')));
    });

    test('includes -ss and -t when a non-zero start is given', () {
      final args = builder.buildGifCommand(
        inputPath: '/tmp/input.mov',
        outputPath: '/tmp/output.gif',
        options: const GifOptions(
          start: Duration(seconds: 2),
          end: Duration(seconds: 7),
          fps: 12,
        ),
      );

      expect(args, contains('-ss'));
      expect(args, contains('-t'));
    });
  });
}
