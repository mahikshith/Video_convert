import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_converter_pro/features/compression/domain/entities/compression_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/destination_preset.dart';
import 'package:video_converter_pro/features/gif_creation/domain/entities/gif_options.dart';
import 'package:video_converter_pro/features/video_conversion/domain/entities/output_format.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/conversion_ui_state.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/video_conversion_provider.dart';

class ConversionSetupPage extends ConsumerStatefulWidget {
  const ConversionSetupPage({super.key});

  @override
  ConsumerState<ConversionSetupPage> createState() =>
      _ConversionSetupPageState();
}

class _ConversionSetupPageState extends ConsumerState<ConversionSetupPage> {
  OutputKind _kind = OutputKind.video;

  OutputFormat _videoFormat = OutputFormat.mp4;
  ConversionPreset _preset =
      const ConversionPreset.compression(CompressionPreset.medium);

  OutputFormat _audioFormat = OutputFormat.mp3;

  int _gifStartSeconds = 0;
  int _gifEndSeconds = 5;
  int _gifFps = 12;

  static const _videoFormats = [
    OutputFormat.mp4,
    OutputFormat.mov,
    OutputFormat.mkv,
    OutputFormat.webm,
  ];
  static const _audioFormats = [
    OutputFormat.mp3,
    OutputFormat.aac,
    OutputFormat.wav,
  ];
  static const _fpsOptions = [8, 12, 15, 24];

  @override
  Widget build(BuildContext context) {
    ref.listen(videoConversionControllerProvider, (previous, next) {
      if (next.valueOrNull is ConversionInProgress) {
        context.go('/progress');
      }
    });

    final uiState = ref.watch(videoConversionControllerProvider).valueOrNull;
    final video =
        uiState is ConversionSelectingPreset ? uiState.video : null;

    if (video == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Conversion Setup')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(video.name, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            '${video.extension.toUpperCase()} · '
            '${(video.sizeBytes / 1024 / 1024).toStringAsFixed(1)} MB',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 24),
          SegmentedButton<OutputKind>(
            segments: const [
              ButtonSegment(value: OutputKind.video, label: Text('Video')),
              ButtonSegment(value: OutputKind.gif, label: Text('GIF')),
              ButtonSegment(value: OutputKind.audio, label: Text('Audio')),
            ],
            selected: {_kind},
            onSelectionChanged: (selection) =>
                setState(() => _kind = selection.first),
          ),
          const SizedBox(height: 24),
          switch (_kind) {
            OutputKind.video => _VideoOptions(
                format: _videoFormat,
                formats: _videoFormats,
                onFormatChanged: (format) =>
                    setState(() => _videoFormat = format),
                preset: _preset,
                onPresetChanged: (preset) => setState(() => _preset = preset),
              ),
            OutputKind.gif => _GifOptionsForm(
                startSeconds: _gifStartSeconds,
                endSeconds: _gifEndSeconds,
                fps: _gifFps,
                fpsOptions: _fpsOptions,
                onStartChanged: (v) => setState(() => _gifStartSeconds = v),
                onEndChanged: (v) => setState(() => _gifEndSeconds = v),
                onFpsChanged: (v) => setState(() => _gifFps = v),
              ),
            OutputKind.audio => _AudioOptions(
                format: _audioFormat,
                formats: _audioFormats,
                onFormatChanged: (format) =>
                    setState(() => _audioFormat = format),
              ),
          },
          const SizedBox(height: 48),
          ElevatedButton.icon(
            onPressed: _onConvert,
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Convert'),
          ),
        ],
      ),
    );
  }

  void _onConvert() {
    final controller = ref.read(videoConversionControllerProvider.notifier);
    switch (_kind) {
      case OutputKind.video:
        controller.startConversion(
          outputFormat: _videoFormat,
          preset: _preset,
        );
      case OutputKind.gif:
        controller.startConversion(
          outputFormat: OutputFormat.gif,
          gifOptions: GifOptions(
            start: Duration(seconds: _gifStartSeconds),
            end: Duration(seconds: _gifEndSeconds),
            fps: _gifFps,
          ),
        );
      case OutputKind.audio:
        controller.startConversion(outputFormat: _audioFormat);
    }
  }
}

class _VideoOptions extends StatelessWidget {
  const _VideoOptions({
    required this.format,
    required this.formats,
    required this.onFormatChanged,
    required this.preset,
    required this.onPresetChanged,
  });

  final OutputFormat format;
  final List<OutputFormat> formats;
  final ValueChanged<OutputFormat> onFormatChanged;
  final ConversionPreset preset;
  final ValueChanged<ConversionPreset> onPresetChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Output Format', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: formats.map((f) {
            return ChoiceChip(
              label: Text(f.extension.toUpperCase()),
              selected: format == f,
              onSelected: (_) => onFormatChanged(f),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        Text('Compression', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: CompressionPreset.values.map((p) {
            final selection = ConversionPreset.compression(p);
            return ChoiceChip(
              label: Text(p.label),
              selected: preset == selection,
              onSelected: (_) => onPresetChanged(selection),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),
        Text('Destination', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: DestinationPreset.values.map((p) {
            final selection = ConversionPreset.destination(p);
            return ChoiceChip(
              label: Text(p.label),
              selected: preset == selection,
              onSelected: (_) => onPresetChanged(selection),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _AudioOptions extends StatelessWidget {
  const _AudioOptions({
    required this.format,
    required this.formats,
    required this.onFormatChanged,
  });

  final OutputFormat format;
  final List<OutputFormat> formats;
  final ValueChanged<OutputFormat> onFormatChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Audio Format', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: formats.map((f) {
            return ChoiceChip(
              label: Text(f.extension.toUpperCase()),
              selected: format == f,
              onSelected: (_) => onFormatChanged(f),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _GifOptionsForm extends StatelessWidget {
  const _GifOptionsForm({
    required this.startSeconds,
    required this.endSeconds,
    required this.fps,
    required this.fpsOptions,
    required this.onStartChanged,
    required this.onEndChanged,
    required this.onFpsChanged,
  });

  final int startSeconds;
  final int endSeconds;
  final int fps;
  final List<int> fpsOptions;
  final ValueChanged<int> onStartChanged;
  final ValueChanged<int> onEndChanged;
  final ValueChanged<int> onFpsChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Clip Range (seconds)', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: '$startSeconds',
                decoration: const InputDecoration(labelText: 'Start'),
                keyboardType: TextInputType.number,
                onChanged: (v) => onStartChanged(int.tryParse(v) ?? 0),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                initialValue: '$endSeconds',
                decoration: const InputDecoration(labelText: 'End'),
                keyboardType: TextInputType.number,
                onChanged: (v) => onEndChanged(int.tryParse(v) ?? 0),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text('Frame Rate', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: fpsOptions.map((f) {
            return ChoiceChip(
              label: Text('$f fps'),
              selected: fps == f,
              onSelected: (_) => onFpsChanged(f),
            );
          }).toList(),
        ),
      ],
    );
  }
}
