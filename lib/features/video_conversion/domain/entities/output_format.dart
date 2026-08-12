enum OutputKind { video, gif, audio }

enum OutputFormat {
  mp4('mp4', kind: OutputKind.video),
  mov('mov', kind: OutputKind.video),
  mkv('mkv', kind: OutputKind.video),
  webm('webm', kind: OutputKind.video),
  gif('gif', kind: OutputKind.gif),
  mp3('mp3', kind: OutputKind.audio),
  aac('aac', kind: OutputKind.audio),
  wav('wav', kind: OutputKind.audio);

  const OutputFormat(this.extension, {required this.kind});

  final String extension;
  final OutputKind kind;
}
