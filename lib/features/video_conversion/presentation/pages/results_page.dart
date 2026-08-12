import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_converter_pro/core/services/logger_service.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/conversion_ui_state.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/video_conversion_provider.dart';

class ResultsPage extends ConsumerWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(videoConversionControllerProvider).valueOrNull;

    if (uiState is! ConversionCompleted) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final result = uiState.result;
    final savedPercent = result.inputSizeBytes == 0
        ? 0.0
        : (1 - result.outputSizeBytes / result.inputSizeBytes) * 100;

    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 64),
            const SizedBox(height: 16),
            Text(
              '${(result.inputSizeBytes / 1024 / 1024).toStringAsFixed(1)} MB'
              ' → ${(result.outputSizeBytes / 1024 / 1024).toStringAsFixed(1)} MB',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              savedPercent > 0
                  ? '${savedPercent.toStringAsFixed(0)}% smaller'
                  : 'No size reduction',
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () => _save(context, result.outputPath),
                  icon: const Icon(Icons.save_alt_rounded),
                  label: const Text('Save'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () =>
                      Share.shareXFiles([XFile(result.outputPath)]),
                  icon: const Icon(Icons.share_rounded),
                  label: const Text('Share'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                ref.read(videoConversionControllerProvider.notifier).reset();
                context.go('/');
              },
              child: const Text('Convert Another'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save(BuildContext context, String outputPath) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final docsDir = await getApplicationDocumentsDirectory();
      final convertedDir = Directory('${docsDir.path}/converted');
      if (!convertedDir.existsSync()) {
        convertedDir.createSync(recursive: true);
      }
      // Output paths are always joined with '/', so match either separator
      // rather than only the host platform's.
      final fileName = outputPath.split(RegExp(r'[/\\]')).last;
      final savedPath = '${convertedDir.path}/$fileName';
      await File(outputPath).copy(savedPath);
      messenger.showSnackBar(
        SnackBar(content: Text('Saved to $savedPath')),
      );
    } catch (e, stackTrace) {
      LoggerService.error(
        'Failed to save converted file',
        error: e,
        stackTrace: stackTrace,
      );
      messenger.showSnackBar(
        const SnackBar(content: Text('Could not save that file.')),
      );
    }
  }
}
