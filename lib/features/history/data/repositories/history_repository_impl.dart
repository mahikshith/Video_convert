import 'package:video_converter_pro/features/history/data/datasources/hive_history_datasource.dart';
import 'package:video_converter_pro/features/history/domain/entities/conversion_history_entry.dart';
import 'package:video_converter_pro/features/history/domain/repositories/history_repository.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  const HistoryRepositoryImpl(this._dataSource);

  final HiveHistoryDataSource _dataSource;

  @override
  Future<List<ConversionHistoryEntry>> getAll() async {
    final raw = await _dataSource.getAll();
    final entries = raw.map(ConversionHistoryEntry.fromJson).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return entries;
  }

  @override
  Future<void> add(ConversionHistoryEntry entry) {
    return _dataSource.put(entry.id, entry.toJson());
  }

  @override
  Future<void> delete(String id) => _dataSource.delete(id);

  @override
  Future<void> clear() => _dataSource.clear();
}
