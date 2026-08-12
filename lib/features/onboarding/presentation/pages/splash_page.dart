import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_converter_pro/core/services/logger_service.dart';
import 'package:video_converter_pro/features/settings/presentation/providers/settings_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    _decideNextRoute();
  }

  Future<void> _decideNextRoute() async {
    final minDelay = Future<void>.delayed(const Duration(milliseconds: 1200));
    // A failed preference read must not strand the user on the splash
    // screen; showing onboarding again is the safe fallback.
    var hasSeenOnboarding = false;
    try {
      hasSeenOnboarding =
          await ref.read(settingsRepositoryProvider).hasSeenOnboarding();
    } catch (e, stackTrace) {
      LoggerService.error(
        'Could not read the onboarding flag',
        error: e,
        stackTrace: stackTrace,
      );
    }
    await minDelay;
    if (!mounted) return;
    context.go(hasSeenOnboarding ? '/' : '/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(
          Icons.video_file_outlined,
          size: 96,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
