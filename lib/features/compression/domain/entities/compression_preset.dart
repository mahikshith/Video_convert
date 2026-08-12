enum CompressionPreset {
  small(
    label: 'Small',
    description: 'Email friendly',
    maxWidth: 640,
    maxHeight: 640,
    videoBitrateKbps: 800,
    audioBitrateKbps: 96,
    crf: 28,
  ),
  medium(
    label: 'Medium',
    description: 'WhatsApp friendly',
    maxWidth: 1280,
    maxHeight: 1280,
    videoBitrateKbps: 1500,
    audioBitrateKbps: 128,
    crf: 24,
  ),
  high(
    label: 'High',
    description: 'Instagram friendly',
    maxWidth: 1920,
    maxHeight: 1920,
    videoBitrateKbps: 3500,
    audioBitrateKbps: 128,
    crf: 20,
  ),
  original(
    label: 'Original Quality',
    description: 'Minimal compression',
    maxWidth: null,
    maxHeight: null,
    // Hardware H.264 encoders (this app has no software libx264 — see
    // docs/DECISIONS.md) take a target bitrate, not a quality factor, so
    // this can't be crf-only the way a software encoder preset could be.
    // 8000kbps is a generous near-source-quality bitrate at typical phone
    // video resolutions.
    videoBitrateKbps: 8000,
    audioBitrateKbps: 192,
    crf: 18,
  );

  const CompressionPreset({
    required this.label,
    required this.description,
    required this.maxWidth,
    required this.maxHeight,
    required this.videoBitrateKbps,
    required this.audioBitrateKbps,
    required this.crf,
  });

  final String label;
  final String description;
  final int? maxWidth;
  final int? maxHeight;
  final int? videoBitrateKbps;
  final int audioBitrateKbps;
  final int crf;
}
