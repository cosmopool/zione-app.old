import 'package:flutter/material.dart';

import 'package:zione_app/core/constants.dart';
import 'package:zione_app/repositories/entry_repository.dart';
import 'package:zione_app/features/entry/entry_model.dart';
import 'package:zione_app/features/ticket/ticket_model.dart';
import 'package:zione_app/features/agenda/agenda_entry_model.dart';

class FeedRepository extends ChangeNotifier {
  List listOfAgendaEntries = [];
  List listOfTickets = [];
  bool isLoading = false;

  List get getAgendaEntryFeed {
    return listOfAgendaEntries;
  }

  void clearListOfAgendaEntries() {
    listOfAgendaEntries = [];
  }

  List get getTicketFeed {
    return listOfTickets;
  }

  void clearListOfTickets() {
    listOfTickets = [];
  }

  void fetchAgendaEntries() async {
    // if there is cached entries dont flag as loading
    // so screens can use cached list instead of loading screen
    (listOfTickets != []) ? isLoading = false : isLoading = true;

    List _temp = [];
    final EntryRepository repository = EntryRepository();

    await repository.fetch(Endpoint.agenda).then((res) {
      var temp = res['Result'];
      temp.forEach((e) {
        _temp.add(AgendaEntry(e));
      });
    });

    listOfTickets = _temp;
    isLoading = false;
    notifyListeners();
  }

  void fetchTickets() async {
    // if there is cached entries dont flag as loading
    // so screens can use cached list instead of loading screen
    (listOfTickets != []) ? isLoading = false : isLoading = true;

    List _temp = [];
    final EntryRepository repository = EntryRepository();

    await repository.fetch(Endpoint.tickets).then((res) {
      var temp = res['Result'];
      temp.forEach((e) {
        _temp.add(Ticket(e));
      });
    });

    listOfTickets = _temp;
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
  // List listOfAgendaEntries = [];
  // List listOfTickets = [];
  // bool isLoading = false;

  // List get getAgendaEntryFeed {
  //   return listOfAgendaEntries;
  // }

  // void clearListOfAgendaEntries() {
  //   listOfAgendaEntries = [];
  // }

  // List get getTicketFeed {
  //   return listOfTickets;
  // }

  // void clearListOfTickets() {
  //   listOfTickets = [];
  // }

  // void fetchAgendaEntries() {
  //   _fetchList(listOfAgendaEntries, Endpoint.agenda, AgendaEntry);
  // }

  // void fetchTickets() {
  //   _fetchList(listOfTickets, Endpoint.tickets, Ticket.fromRequest);
  // }

  // void _fetchList(List list, Endpoint endpoint, entry) async {
  //   // if there is cached entries dont flag as loading
  //   // so screens can use cached list instead of loading screen
  //   (listOfTickets != []) ? isLoading = false : isLoading = true;

  //   List _temp = [];
  //   final EntryRepository repository = EntryRepository();

  //   await repository.fetch(endpoint).then((res) {
  //     var temp = res['Result'];
  //     temp.forEach((e) {
  //       _temp.add(entry(e));
  //     });
  //   });

  //   list = _temp;
  //   isLoading = false;
  //   notifyListeners();
  // }
