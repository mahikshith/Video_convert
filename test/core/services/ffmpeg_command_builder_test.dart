import 'package:flutter_test/flutter_test.dart';
import 'package:video_converter_pro/core/services/ffmpeg_command_builder.dart';
import 'package:video_converter_pro/features/compression/domain/entities/encoding_settings.dart';

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
  });
}
