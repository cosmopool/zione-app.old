import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:zione_app/model/ticket.dart';
// import 'package:zione_app/model/appointment.dart';
import 'package:zione_app/model/agenda_entry.dart';

import 'package:zione_app/model/request.dart' as req;

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
    Future<void> _showMyDialog(
        String endpoint, int id, Action action, Entry entry) async {
      late String msg;
      late String entryType;
      late String title;
      var fun;

      if (entry == Entry.ticket) {
        entryType = "chamado";
      } else {
        entryType = "agendamento";
      }

      if (action == Action.delete) {
        title = "Deletar $entryType";
        msg = "Tem certeza que deseja deletar esse $entryType?";
        fun = req.deleteContent;
      } else if (action == Action.close) {
        title = "Finalizar $entryType";
        msg = "Tem certeza que deseja finalizar esse $entryType?";
        fun = req.closeContent;
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
                  fun(endpoint, {'id': id});
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
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
            final ticketId = returnIdFromEntry(ticket);
            if (ticketId > 0) {
              _showMyDialog("tickets", ticketId, Action.delete, Entry.ticket);
            }
            final appointmentId = returnIdFromEntry(appointment);
            if (appointmentId > 0) {
              _showMyDialog("appointments", appointmentId, Action.delete,
                  Entry.appointment);
            }
          },
        ),
        ListTile(
          leading: const Icon(FontAwesomeIcons.calendarCheck),
          title: Text("Finalizar $entryTitle"),
          onTap: () {
            final ticketId = returnIdFromEntry(ticket);
            if (ticketId > 0) {
              _showMyDialog("tickets", ticketId, Action.close, Entry.ticket);
            }
            final appointmentId = returnIdFromEntry(appointment);
            if (appointmentId > 0) {
              _showMyDialog("appointments", appointmentId, Action.close,
                  Entry.appointment);
            }
          },
        ),
        ListTile(
          leading: const Icon(FontAwesomeIcons.edit),
          title: Text("Editar $entryTitle"),
          onTap: () => print('edit this entry'),
        )
      ],
    );
  }
}
