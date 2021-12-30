import 'package:flutter/material.dart';

import 'package:zione_app/repositories/entry_repository.dart';
import 'package:zione_app/features/entry/entry_model.dart';

class Feed extends ChangeNotifier {
  List<Entry> listOfEntries = [];

  List<Entry> get getFeed {
    return listOfEntries;
  }

  void fetchEntries(Endpoint endpoint) {
    final EntryRepository repository = EntryRepository();
    repository.fetch(endpoint);
    notifyListeners();
  }

  void deleteEntry(Entry entry, Endpoint endpoint) {
    final EntryRepository repository = EntryRepository();
    repository.delete(entry, endpoint);
    notifyListeners();
  }

  void insertEntry(Entry entry, Endpoint endpoint) {
    final EntryRepository repository = EntryRepository();
    repository.post(entry, endpoint);
    notifyListeners();
  }

  void closeEntry(Entry entry, Endpoint endpoint) {
    final EntryRepository repository = EntryRepository();
    repository.close(entry, endpoint);
    notifyListeners();
  }
}
