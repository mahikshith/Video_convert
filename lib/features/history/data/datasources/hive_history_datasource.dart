import 'package:hive_flutter/hive_flutter.dart';

class HiveHistoryDataSource {
  const HiveHistoryDataSource({this.boxName = 'conversion_history'});

  final String boxName;

  Future<Box<dynamic>> _openBox() => Hive.openBox<dynamic>(boxName);

  Future<List<Map<String, dynamic>>> getAll() async {
    final box = await _openBox();
    return box.values
        .map((raw) => Map<String, dynamic>.from(raw as Map))
        .toList();
  }

  Future<void> put(String id, Map<String, dynamic> json) async {
    final box = await _openBox();
    await box.put(id, json);
  }

  Future<void> delete(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }

  Future<void> clear() async {
    final box = await _openBox();
    await box.clear();
  }
}
