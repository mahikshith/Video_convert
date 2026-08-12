import 'package:go_router/go_router.dart';
import 'package:video_converter_pro/features/home/presentation/pages/home_page.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/pages/conversion_setup_page.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/pages/progress_page.dart';
import 'package:video_converter_pro/features/video_conversion/presentation/pages/results_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/setup',
      builder: (context, state) => const ConversionSetupPage(),
    ),
    GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressPage(),
    ),
    GoRoute(
      path: '/results',
      builder: (context, state) => const ResultsPage(),
    ),
  ],
);
