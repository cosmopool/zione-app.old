import 'package:flutter/material.dart';

import 'package:zione_app/core/constants.dart';
import 'package:zione_app/repositories/entry_repository.dart';
import 'package:zione_app/features/entry/entry_model.dart';
import 'package:zione_app/features/ticket/ticket_model.dart';
// import 'package:zione_app/features/appointment/appointment_model.dart';

class FeedRepository extends ChangeNotifier {
  List listOfEntries = [];
  bool isLoading = false;

  List get getFeed {
    return listOfEntries;
  }

  void clearListOfEntries() {
    listOfEntries = [];
  }

  void fetchEntries(Endpoint endpoint) async {
    isLoading = true;
    // notifyListeners();

    clearListOfEntries();
    final EntryRepository repository = EntryRepository();
    await repository.fetch(endpoint).then((res) {
      var temp = res['Result'];
      temp.forEach((e) {
        listOfEntries.add(Ticket(e));
      });
    });

    isLoading = false;
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
