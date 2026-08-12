class EncodingSettings {
  const EncodingSettings({
    this.maxWidth,
    this.maxHeight,
    this.videoBitrateKbps,
    required this.audioBitrateKbps,
    this.crf,
  });

  final int? maxWidth;
  final int? maxHeight;

  /// If null and [crf] is also null, encoder defaults are used.
  final int? videoBitrateKbps;
  final int audioBitrateKbps;

  /// Constant Rate Factor — used instead of a fixed bitrate for
  /// quality-targeted (rather than size-targeted) presets.
  final int? crf;
}
