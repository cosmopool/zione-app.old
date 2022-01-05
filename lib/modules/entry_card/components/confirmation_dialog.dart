import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zione_app/core/constants.dart';
import 'package:zione_app/features/ticket/ticket_model.dart';
import 'package:zione_app/features/agenda/agenda_entry_model.dart';
import 'package:/zione_app/features/entry_card/card_controller.dart';

Future<void> _showMyDialog(Action action) async {
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
    request =
        () => context.read<FeedRepository>().deleteEntry(thisEntry, endpoint);
    var _temp = thisEntry.toMap();
    // print("entryToMap: $_temp \n");
  } else if (action == Action.close) {
    title = "Finalizar $entryType";
    msg = "Tem certeza que deseja finalizar esse $entryType?";
    // request = req.closeContent;
    request =
        () => context.read<FeedRepository>().closeEntry(thisEntry, endpoint);
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
