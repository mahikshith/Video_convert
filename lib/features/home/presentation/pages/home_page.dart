import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_converter_pro/core/error/failure.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/conversion_ui_state.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/video_conversion_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversionState = ref.watch(videoConversionControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Converter Pro'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.video_file_outlined,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'Video Converter Pro',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Convert, Compress, Share — All On Device',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white70,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              conversionState.when(
                data: (uiState) => _ConversionBody(uiState: uiState),
                loading: () => const CircularProgressIndicator(),
                error: (error, _) => _ErrorBody(error: error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConversionBody extends ConsumerWidget {
  const _ConversionBody({required this.uiState});

  final ConversionUiState uiState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (uiState) {
      ConversionIdle() => const _SelectVideoButton(),
      ConversionInProgress(:final progress) => Column(
          children: [
            CircularProgressIndicator(value: progress.percent),
            const SizedBox(height: 8),
            Text('${(progress.percent * 100).toStringAsFixed(0)}%'),
          ],
        ),
      ConversionCompleted(:final result) => Column(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 32),
            const SizedBox(height: 8),
            Text(
              '${(result.inputSizeBytes / 1024 / 1024).toStringAsFixed(1)} MB'
              ' → ${(result.outputSizeBytes / 1024 / 1024).toStringAsFixed(1)} MB',
            ),
            const SizedBox(height: 16),
            const _SelectVideoButton(),
          ],
        ),
    };
  }
}

class _ErrorBody extends ConsumerWidget {
  const _ErrorBody({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(
          error is Failure ? (error as Failure).message : 'Conversion failed',
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        const _SelectVideoButton(),
      ],
    );
  }
}

class _SelectVideoButton extends ConsumerWidget {
  const _SelectVideoButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () =>
          ref.read(videoConversionControllerProvider.notifier).pickAndConvert(),
      icon: const Icon(Icons.add_rounded),
      label: const Text('Select Video'),
    );
  }
}
