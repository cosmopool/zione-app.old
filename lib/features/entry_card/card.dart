import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:zione_app/features/ticket/ticket_model.dart';
import 'package:zione_app/features/agenda/agenda_entry_model.dart';

import 'package:zione_app/features/entry_card/card_menu.dart';
import 'package:zione_app/features/bottom_modal/bottom_modal.dart';

import 'package:zione_app/features/url_app_launcher/url_launcher.dart' as launch;

Widget dividerTheme() {
  return const Divider(
    thickness: 1,
    indent: 20,
    endIndent: 20,
  );
}

class EntryCard extends StatefulWidget {
  final AgendaEntry entry;

  const EntryCard({Key? key, required this.entry}) : super(key: key);

  @override
  _EntryCardState createState() => _EntryCardState();
}

class _EntryCardState extends State<EntryCard> {
  bool expanded = false;
  double borderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 7.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ListTile(
                title: Text(
                  widget.entry.time,
                  style: TextStyle(
                    fontSize: expanded ? 50 : 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                // trailing: expanded ? const Icon(FontAwesomeIcons.ellipsisV) : null,
                trailing: expanded
                    ? IconButton(
                        icon: const Icon(FontAwesomeIcons.ellipsisV),
                        onPressed: () => showBottomAutoSizeModal(context, CardMenu("agendamento", null, widget.entry)),
                      )
                    : null,
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
              ),
            ),
            Visibility(
              visible: !expanded,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.entry.clientAddress),
                      subtitle: Text(widget.entry.serviceType),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: expanded,
              child: Column(
                children: [
                  dividerTheme(),
                  ListTile(
                    title: Text(widget.entry.clientName),
                    subtitle: Text(widget.entry.serviceType),
                    // trailing: const Icon(FontAwesomeIcons.phone),
                    trailing: IconButton(
                    onPressed: () => launch.phone(widget.entry.clientPhone),
                        icon: const Icon(FontAwesomeIcons.phone)),
                  ),
                  dividerTheme(),
                  ListTile(
                    title: Text(widget.entry.clientAddress),
                    subtitle: Text(widget.entry.clientAddress),
                    // trailing: const Icon(Icons.location_on),
                    trailing: IconButton(
                    onPressed: () => launch.maps(widget.entry.clientAddress),
                        icon: const Icon(FontAwesomeIcons.mapMarkerAlt)),
                  ),
                  dividerTheme(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ListTile(
                      title: Text(widget.entry.description),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketCard extends StatefulWidget {
  final Ticket ticket;

  const TicketCard({Key? key, required this.ticket}) : super(key: key);

  @override
  _TicketCardState createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  bool expanded = false;
  double borderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.symmetric(
            horizontal: expanded ? 15 : 20, vertical: expanded ? 20 : 7.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: ListTile(
                title: Text(
                  widget.ticket.clientName,
                  style: TextStyle(
                    fontSize: expanded ? 48 : 40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                trailing: expanded
                    ? IconButton(
                        icon: const Icon(FontAwesomeIcons.ellipsisV),
                        onPressed: () => showBottomAutoSizeModal(context, CardMenu("chamado", widget.ticket, null)),
                      )
                    : null,
                onTap: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
              ),
            ),
            Visibility(
              visible: !expanded,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.ticket.clientAddress),
                      subtitle: Text(widget.ticket.serviceType),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: expanded,
              child: Column(
                children: [
                  dividerTheme(),
                  ListTile(
                    title: Text(widget.ticket.clientName),
                    subtitle: Text(widget.ticket.serviceType),
                    // trailing: const Icon(FontAwesomeIcons.phone),
                    trailing: IconButton(
                    onPressed: () => launch.phone(widget.ticket.clientPhone),
                        icon: const Icon(FontAwesomeIcons.phone)),
                  ),
                  dividerTheme(),
                  ListTile(
                    title: Text(widget.ticket.clientAddress),
                    subtitle: Text(widget.ticket.clientAddress),
                    // trailing: const Icon(Icons.location_on),
                    trailing: IconButton(
                    onPressed: () => launch.maps(widget.ticket.clientAddress),
                        icon: const Icon(FontAwesomeIcons.mapMarkerAlt)),
                  ),
                  dividerTheme(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ListTile(
                      title: Text(widget.ticket.description),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
