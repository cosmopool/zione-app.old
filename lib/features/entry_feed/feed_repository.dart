import 'package:flutter/material.dart';

import 'package:zione_app/core/constants.dart';
import 'package:zione_app/repositories/entry_repository.dart';
import 'package:zione_app/features/entry/entry_model.dart';
import 'package:zione_app/features/ticket/ticket_model.dart';
import 'package:zione_app/features/agenda/agenda_entry_model.dart';

class FeedRepository extends ChangeNotifier {
  List listOfAgendaEntries = [];
  List listOfTickets = [];
  List listOfAppointments = [];
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

  void fetchAgendaEntries() {
    AgendaEntry agendaEntryClass(val) {
      return AgendaEntry(val);
    }

    _fetchList(listOfAgendaEntries, Endpoint.agenda, agendaEntryClass);
  }

  void fetchTickets() {
    Ticket ticketClass(val) {
      return Ticket(val);
    }

    _fetchList(listOfTickets, Endpoint.tickets, ticketClass);
  }

  void _fetchList(List list, Endpoint endpoint, entryClass) async {
    // late List list;
    
    // if there is cached entries dont flag as loading
    // so screens can use cached list instead of loading screen
    (list != []) ? isLoading = false : isLoading = true;

    List _list = [];
    final EntryRepository repository = EntryRepository();

    await repository.fetch(endpoint).then((res) {
      var temp = res['Result'];
      temp.forEach((e) {
        _list.add(entryClass(e));
      });
    });

    // TODO: don't know why this line doesn't work!!!!
    // list = _list;
    // so a coded this hack below
    switch (endpoint) {
      case Endpoint.tickets: { listOfTickets = _list; } break;
      case Endpoint.agenda: { listOfAgendaEntries = _list; } break;
      case Endpoint.appointments: { listOfAppointments = _list; } break;
    }

    isLoading = false;
    notifyListeners();
  }

  void deleteEntry(entry, Endpoint endpoint) {
    final EntryRepository repository = EntryRepository();
    repository.delete(entry, endpoint);
    notifyListeners();
  }

  void insertEntry(entry, Endpoint endpoint) {
    final EntryRepository repository = EntryRepository();
    repository.post(entry, endpoint);
    notifyListeners();
  }

  void closeEntry(entry, Endpoint endpoint) {
    final EntryRepository repository = EntryRepository();
    repository.close(entry, endpoint);
    notifyListeners();
  }
}
