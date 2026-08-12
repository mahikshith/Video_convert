import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_converter_pro/features/compression/domain/entities/compression_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/destination_preset.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/conversion_ui_state.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/video_conversion_provider.dart';

class ConversionSetupPage extends ConsumerStatefulWidget {
  const ConversionSetupPage({super.key});

  @override
  ConsumerState<ConversionSetupPage> createState() =>
      _ConversionSetupPageState();
}

class _ConversionSetupPageState extends ConsumerState<ConversionSetupPage> {
  ConversionPreset _selected =
      const ConversionPreset.compression(CompressionPreset.medium);

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
            '${video.extension.toUpperCase()} → MP4 · '
            '${(video.sizeBytes / 1024 / 1024).toStringAsFixed(1)} MB',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 32),
          Text('Compression', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: CompressionPreset.values.map((preset) {
              final selection = ConversionPreset.compression(preset);
              return ChoiceChip(
                label: Text(preset.label),
                selected: _selected == selection,
                onSelected: (_) => setState(() => _selected = selection),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text('Destination', style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: DestinationPreset.values.map((preset) {
              final selection = ConversionPreset.destination(preset);
              return ChoiceChip(
                label: Text(preset.label),
                selected: _selected == selection,
                onSelected: (_) => setState(() => _selected = selection),
              );
            }).toList(),
          ),
          const SizedBox(height: 48),
          ElevatedButton.icon(
            onPressed: () => ref
                .read(videoConversionControllerProvider.notifier)
                .startConversion(_selected),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Convert'),
          ),
        ],
      ),
    );
  }
}
