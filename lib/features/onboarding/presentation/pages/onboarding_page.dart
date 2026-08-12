import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:video_converter_pro/features/settings/presentation/providers/settings_provider.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Icon(
                Icons.video_file_outlined,
                size: 72,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'Video Converter Pro',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Convert, compress, and share videos completely on-device.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              const _OnboardingBullet(
                icon: Icons.lock_outline,
                text: 'No uploads — everything happens on your device',
              ),
              const SizedBox(height: 12),
              const _OnboardingBullet(
                icon: Icons.no_accounts_outlined,
                text: 'No accounts, no sign-up',
              ),
              const SizedBox(height: 12),
              const _OnboardingBullet(
                icon: Icons.block_outlined,
                text: 'No watermarks, no subscription traps',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _getStarted(context, ref),
                  child: const Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getStarted(BuildContext context, WidgetRef ref) async {
    await ref.read(settingsRepositoryProvider).markOnboardingSeen();
    if (context.mounted) context.go('/');
  }
}

class _OnboardingBullet extends StatelessWidget {
  const _OnboardingBullet({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
