enum OutputFormat {
  mp4('mp4'),
  mov('mov'),
  mkv('mkv'),
  webm('webm');

  const OutputFormat(this.extension);

  final String extension;
}
