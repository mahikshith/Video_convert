/// Builds argument lists for FFmpegKit's `executeWithArgumentsAsync`.
///
/// Arguments are returned as a list (not a shell string) so paths with
/// spaces or special characters don't need manual escaping.
class FfmpegCommandBuilder {
  const FfmpegCommandBuilder();

  List<String> buildConvertCommand({
    required String inputPath,
    required String outputPath,
  }) {
    return [
      '-y',
      '-i', inputPath,
      '-c:v', 'libx264',
      '-preset', 'medium',
      '-c:a', 'aac',
      outputPath,
    ];
  }
}
