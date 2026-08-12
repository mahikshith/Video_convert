import 'package:flutter_test/flutter_test.dart';
import 'package:video_converter_pro/core/services/ffmpeg_command_builder.dart';

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
  });
}
