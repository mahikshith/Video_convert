import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:video_converter_pro/features/history/data/datasources/hive_history_datasource.dart';
import 'package:video_converter_pro/features/history/data/repositories/history_repository_impl.dart';
import 'package:video_converter_pro/features/history/domain/entities/conversion_history_entry.dart';

class MockHiveHistoryDataSource extends Mock implements HiveHistoryDataSource {}

void main() {
  late MockHiveHistoryDataSource dataSource;
  late HistoryRepositoryImpl repository;

  final older = ConversionHistoryEntry(
    id: '1',
    inputFileName: 'older.mov',
    outputPath: '/tmp/older.mp4',
    outputExtension: 'mp4',
    inputSizeBytes: 100,
    outputSizeBytes: 50,
    timestamp: DateTime(2026, 1, 1),
  );
  final newer = ConversionHistoryEntry(
    id: '2',
    inputFileName: 'newer.mov',
    outputPath: '/tmp/newer.mp4',
    outputExtension: 'mp4',
    inputSizeBytes: 200,
    outputSizeBytes: 80,
    timestamp: DateTime(2026, 6, 1),
  );

  setUp(() {
    dataSource = MockHiveHistoryDataSource();
    repository = HistoryRepositoryImpl(dataSource);
  });

  group('HistoryRepositoryImpl', () {
    test('getAll returns entries newest first', () async {
      when(() => dataSource.getAll())
          .thenAnswer((_) async => [older.toJson(), newer.toJson()]);

      final result = await repository.getAll();

      expect(result.map((e) => e.id), ['2', '1']);
    });

    test('add serializes the entry to the data source', () async {
      when(() => dataSource.put(any(), any())).thenAnswer((_) async {});

      await repository.add(newer);

      verify(() => dataSource.put('2', newer.toJson())).called(1);
    });

    test('delete forwards to the data source', () async {
      when(() => dataSource.delete(any())).thenAnswer((_) async {});

      await repository.delete('2');

      verify(() => dataSource.delete('2')).called(1);
    });

    test('clear forwards to the data source', () async {
      when(() => dataSource.clear()).thenAnswer((_) async {});

      await repository.clear();

      verify(() => dataSource.clear()).called(1);
    });
  });
}
