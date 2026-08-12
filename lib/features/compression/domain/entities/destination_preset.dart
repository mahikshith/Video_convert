enum DestinationPreset {
  whatsapp(
    label: 'WhatsApp',
    maxWidth: 1280,
    maxHeight: 720,
    videoBitrateKbps: 1500,
    audioBitrateKbps: 128,
    targetMaxSizeBytes: null,
  ),
  instagramReel(
    label: 'Instagram Reel',
    maxWidth: 1080,
    maxHeight: 1920,
    videoBitrateKbps: 3500,
    audioBitrateKbps: 128,
    targetMaxSizeBytes: null,
  ),
  tiktok(
    label: 'TikTok',
    maxWidth: 1080,
    maxHeight: 1920,
    videoBitrateKbps: 3500,
    audioBitrateKbps: 128,
    targetMaxSizeBytes: null,
  ),
  youtube(
    label: 'YouTube',
    maxWidth: 1920,
    maxHeight: 1080,
    videoBitrateKbps: 8000,
    audioBitrateKbps: 192,
    targetMaxSizeBytes: null,
  ),
  email(
    label: 'Email',
    maxWidth: 1280,
    maxHeight: 720,
    // No fixed bitrate: computed from targetMaxSizeBytes and the input's
    // duration by EncodingSettingsResolver.
    videoBitrateKbps: null,
    audioBitrateKbps: 96,
    targetMaxSizeBytes: 25 * 1024 * 1024,
  );

  const DestinationPreset({
    required this.label,
    required this.maxWidth,
    required this.maxHeight,
    required this.videoBitrateKbps,
    required this.audioBitrateKbps,
    required this.targetMaxSizeBytes,
  });

  final String label;
  final int maxWidth;
  final int maxHeight;
  final int? videoBitrateKbps;
  final int audioBitrateKbps;
  final int? targetMaxSizeBytes;
}
