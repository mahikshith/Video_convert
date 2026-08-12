import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_converter_pro/core/error/failure.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/conversion_ui_state.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/video_conversion_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(videoConversionControllerProvider, (previous, next) {
      if (next.valueOrNull is ConversionSelectingPreset) {
        context.go('/setup');
      }
    });

    final conversionState = ref.watch(videoConversionControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Converter Pro'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded),
            tooltip: 'History',
            onPressed: () => context.push('/history'),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () => context.push('/settings'),
          ),
        ],
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
                data: (_) => const _SelectVideoButton(),
                loading: () => const CircularProgressIndicator(),
                error: (error, _) => Column(
                  children: [
                    Text(
                      error is Failure ? error.message : 'Something went wrong',
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const _SelectVideoButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelectVideoButton extends ConsumerWidget {
  const _SelectVideoButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () =>
          ref.read(videoConversionControllerProvider.notifier).pickVideo(),
      icon: const Icon(Icons.add_rounded),
      label: const Text('Select Video'),
    );
  }
}
