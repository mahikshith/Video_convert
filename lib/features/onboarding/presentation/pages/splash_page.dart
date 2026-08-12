import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
    final hasSeenOnboarding =
        await ref.read(settingsRepositoryProvider).hasSeenOnboarding();
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
