import 'dart:developer' as developer;

class LoggerService {
  const LoggerService._();

  static void info(String message, {String? tag}) {
    developer.log(message, name: tag ?? 'APP');
  }

  static void warning(String message, {String? tag}) {
    developer.log('⚠️ $message', name: tag ?? 'APP');
  }

  static void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      '❌ $message',
      name: tag ?? 'APP',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
