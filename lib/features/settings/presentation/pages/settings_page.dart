import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_converter_pro/features/compression/domain/entities/compression_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/conversion_preset.dart';
import 'package:video_converter_pro/features/compression/domain/entities/destination_preset.dart';
import 'package:video_converter_pro/features/history/presentation/providers/history_provider.dart';
import 'package:video_converter_pro/features/settings/presentation/providers/settings_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultPresetAsync = ref.watch(defaultPresetControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Default Preset', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'Pre-fills the compression preset when you start a new conversion.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          defaultPresetAsync.when(
            data: (selected) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Compression',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: CompressionPreset.values.map((p) {
                    final selection = ConversionPreset.compression(p);
                    return ChoiceChip(
                      label: Text(p.label),
                      selected: selected == selection,
                      onSelected: (_) => ref
                          .read(defaultPresetControllerProvider.notifier)
                          .setDefaultPreset(selection),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Text(
                  'Destination',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: DestinationPreset.values.map((p) {
                    final selection = ConversionPreset.destination(p);
                    return ChoiceChip(
                      label: Text(p.label),
                      selected: selected == selection,
                      onSelected: (_) => ref
                          .read(defaultPresetControllerProvider.notifier)
                          .setDefaultPreset(selection),
                    );
                  }).toList(),
                ),
              ],
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) =>
                const Text('Could not load settings'),
          ),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => _confirmClearHistory(context, ref),
            icon: const Icon(Icons.delete_sweep_outlined),
            label: const Text('Clear History'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmClearHistory(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear history?'),
        content: const Text(
          'This removes your conversion history. Converted files on disk '
          'are not deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(historyControllerProvider.notifier).clear();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('History cleared')),
        );
      }
    }
  }
}
