sealed class Failure {
  const Failure(this.message);

  final String message;
}

final class NoVideoSelectedFailure extends Failure {
  const NoVideoSelectedFailure() : super('No video was selected.');
}

final class UnsupportedFormatFailure extends Failure {
  const UnsupportedFormatFailure(String format)
      : super('Unsupported video format: $format');
}

final class ProbeFailure extends Failure {
  const ProbeFailure(super.message);
}

final class ConversionFailure extends Failure {
  const ConversionFailure(super.message, {this.ffmpegLogs});

  final String? ffmpegLogs;
}

final class ConversionCancelledFailure extends Failure {
  const ConversionCancelledFailure() : super('Conversion was cancelled.');
}

final class FileSystemFailure extends Failure {
  const FileSystemFailure(super.message);
}
