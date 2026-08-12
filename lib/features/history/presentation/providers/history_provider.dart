import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_converter_pro/features/history/data/datasources/hive_history_datasource.dart';
import 'package:video_converter_pro/features/history/data/repositories/history_repository_impl.dart';
import 'package:video_converter_pro/features/history/domain/entities/conversion_history_entry.dart';
import 'package:video_converter_pro/features/history/domain/repositories/history_repository.dart';

part 'history_provider.g.dart';

@riverpod
HistoryRepository historyRepository(Ref ref) {
  return const HistoryRepositoryImpl(HiveHistoryDataSource());
}

@riverpod
class HistoryController extends _$HistoryController {
  @override
  Future<List<ConversionHistoryEntry>> build() {
    return ref.read(historyRepositoryProvider).getAll();
  }

  Future<void> add(ConversionHistoryEntry entry) async {
    await ref.read(historyRepositoryProvider).add(entry);
    ref.invalidateSelf();
    await future;
  }

  Future<void> delete(String id) async {
    await ref.read(historyRepositoryProvider).delete(id);
    ref.invalidateSelf();
    await future;
  }

  Future<void> clear() async {
    await ref.read(historyRepositoryProvider).clear();
    ref.invalidateSelf();
    await future;
  }
}
