import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:zione_app/features/ticket/ticket_model.dart';
import 'package:zione_app/features/agenda/agenda_entry_model.dart';

import 'card_controller.dart';
import 'components/confirmation_dialog.dart';

class CardMenu extends StatelessWidget {
  final String entryTitle;
  final Ticket? ticket;
  final AgendaEntry? appointment;
  // final Appointment? appointment;

  const CardMenu(this.entryTitle, this.ticket, this.appointment);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(FontAwesomeIcons.trash),
          title: Text('Deletar $entryTitle'),
          onTap: () =>
              context.read<EntryCardRepository>().deleteEntry(entry, endpoint),
        ),
        ListTile(
          leading: const Icon(FontAwesomeIcons.calendarCheck),
          title: Text("Finalizar $entryTitle"),
          onTap: () =>
              context.read<FeedRepository>().closeEntry(entry, endpoint),
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
          ),
        )
      ],
    );
  }
}
