import 'package:flutter/material.dart';
import 'data/databaseHandler.dart';

class Storage {
  final StudyCardDatabase _scData;

  static Future<Storage> createFrom(
      {Future<StudyCardDatabase> scFuture}) async {
    final scData = await scFuture;
    final data = Storage(scData);

    return data;
  }

  Storage(this._scData);

  void addToSCData(FlashCardData fc) async {
    await _scData.insert(fc);
  }

  Future<List<FlashCardData>> pullSCGroup(String subject, String topic) async {
    final group = await _scData.retrieveList(subject, topic);
    return group;
  }
}

class StorageApp with ChangeNotifier {
  StorageApp(this._storage);

  final Storage _storage;

  Storage get storage => _storage;

  void refresh() {
    notifyListeners();
  }
}
