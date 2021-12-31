import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:zione_app/features/ticket/ticket_model.dart';
import 'package:zione_app/features/agenda/agenda_entry_model.dart';

import 'package:zione_app/core/constants.dart';

import 'package:zione_app/repositories/request.dart' as req;
import 'package:zione_app/features/entry_feed/feed_repository.dart';

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

class CardMenu extends StatelessWidget {
  final String entryTitle;
  final Ticket? ticket;
  final AgendaEntry? appointment;
  // final Appointment? appointment;

  const CardMenu(this.entryTitle, this.ticket, this.appointment);

  @override
  Widget build(BuildContext context) {
    late final Entry entry;

    final ticketId = returnIdFromEntry(ticket);
    if (ticketId > 0) {
      entry = Entry.ticket;
    }
    final appointmentId = returnIdFromEntry(appointment);
    if (appointmentId > 0) {
      entry = Entry.appointment;
    }

    Future<void> _showMyDialog(Action action) async {
      late int id;
      late String msg;
      late Endpoint endpoint;
      late String entryType;
      late String title;
      var request;
      late var thisEntry;

      if (entry == Entry.ticket) {
        entryType = "chamado";
        endpoint = Endpoint.tickets;
        thisEntry = ticket;
        id = ticketId;
      } else {
        entryType = "agendamento";
        endpoint = Endpoint.appointments;
        thisEntry = appointment;
        id = appointmentId;
      }

      if (action == Action.delete) {
        title = "Deletar $entryType";
        msg = "Tem certeza que deseja deletar esse $entryType?";
        request = () => context.read<FeedRepository>().deleteEntry(thisEntry, endpoint);
        var _temp = thisEntry.toMap();
        // print("entryToMap: $_temp \n");
      } else if (action == Action.close) {
        title = "Finalizar $entryType";
        msg = "Tem certeza que deseja finalizar esse $entryType?";
        // request = req.closeContent;
        request = () => context.read<FeedRepository>().closeEntry(thisEntry, endpoint);
      }

      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Não'),
              ),
              TextButton(
                child: const Text('Sim'),
                onPressed: () {
                  // request(endpoint, {'id': id});
                  request();
                  // TODO: snackbar with response status
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }

    return Column(
      children: [
        ListTile(
          leading: const Icon(FontAwesomeIcons.trash),
          title: Text('Deletar $entryTitle'),
          onTap: () {
            _showMyDialog(Action.delete);
          },
        ),
        ListTile(
          leading: const Icon(FontAwesomeIcons.calendarCheck),
          title: Text("Finalizar $entryTitle"),
          onTap: () {
            _showMyDialog(Action.close);
          },
        ),
        ListTile(
          leading: const Icon(FontAwesomeIcons.edit),
          title: Text("Editar $entryTitle"),
          onTap: () {
            // TODO: implement edit form
            print('edit this entry');
            Navigator.pop(context);
          },
        ),
        Visibility(
            visible: (entry == Entry.ticket),
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.calendarAlt),
              title: const Text("Marcar Agendamento"),
              onTap: () {
                // TODO: implement book appointment
                print('book appointment');
                Navigator.pop(context);
              },
            ))
      ],
    );
  }
}
