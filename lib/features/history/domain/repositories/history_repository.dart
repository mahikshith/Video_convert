import 'package:video_converter_pro/features/history/domain/entities/conversion_history_entry.dart';

abstract interface class HistoryRepository {
  /// Newest first.
  Future<List<ConversionHistoryEntry>> getAll();
  Future<void> add(ConversionHistoryEntry entry);
  Future<void> delete(String id);
  Future<void> clear();
}
