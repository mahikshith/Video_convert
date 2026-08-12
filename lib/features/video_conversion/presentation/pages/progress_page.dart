import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_converter_pro/core/error/failure.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/conversion_ui_state.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/providers/video_conversion_provider.dart';

class ProgressPage extends ConsumerStatefulWidget {
  const ProgressPage({super.key});

  @override
  ConsumerState<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends ConsumerState<ProgressPage> {
  bool _navigatedToResults = false;

  /// Short conversions can finish before this page is even mounted, so the
  /// completed state is checked on every build rather than only listened for
  /// — a listener registered after the transition would never fire and the
  /// page would sit on a spinner forever.
  void _goToResults() {
    if (_navigatedToResults) return;
    _navigatedToResults = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.go('/results');
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = ref.watch(videoConversionControllerProvider);
    if (uiState.valueOrNull is ConversionCompleted) {
      _goToResults();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Converting')),
      body: Center(
        child: uiState.when(
          data: (state) => switch (state) {
            ConversionInProgress(:final progress) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: CircularProgressIndicator(
                      value: progress.percent,
                      strokeWidth: 8,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${(progress.percent * 100).toStringAsFixed(0)}%',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 32),
                  OutlinedButton(
                    onPressed: () => ref
                        .read(videoConversionControllerProvider.notifier)
                        .cancel(),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            _ => const CircularProgressIndicator(),
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, _) => _ProgressError(error: error),
        ),
      ),
    );
  }
}

class _ProgressError extends ConsumerWidget {
  const _ProgressError({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = this.error;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          error is Failure ? error.message : 'Conversion failed',
          style: const TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            ref.read(videoConversionControllerProvider.notifier).reset();
            context.go('/');
          },
          child: const Text('Back to Home'),
        ),
      ],
    );
  }
}
