import 'package:provider/provider.dart';

import 'package:zione_app/core/constants.dart';
import 'package:zione_app/features/entry_feed/feed_repository.dart';
import 'package:zione_app/features/ticket/ticket_model.dart';
import 'package:zione_app/features/agenda/agenda_entry_model.dart';
// import 'package:zione_app/repositories/request.dart' as req;

int returnIdFromEntry(entry) {
  final id = entry?.id;
  if (id != null) {
    return id;
  } else {
    return 0;
  }
}

enum Action { delete, edit, close }
enum Entry { ticket, appointment }

    late final Entry entry;

    final ticketId = returnIdFromEntry(ticket);
    if (ticketId > 0) {
      entry = Entry.ticket;
    }
    final appointmentId = returnIdFromEntry(appointment);
    if (appointmentId > 0) {
      entry = Entry.appointment;
    }
