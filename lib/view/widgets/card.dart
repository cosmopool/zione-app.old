import 'package:flutter/material.dart';
import 'package:zione_app/model/agenda_entry.dart';

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
        color: expanded ? Colors.white : Colors.grey[300],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                widget.entry.time,
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w900,
                ),
              ),
              trailing: const Icon(Icons.create),
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
            dividerTheme(),
            ListTile(
              title: Text(widget.entry.clientName),
              subtitle: Text(widget.entry.serviceType),
              trailing: const Icon(Icons.phone),
            ),
            dividerTheme(),
            ListTile(
              title: Text(widget.entry.clientAddress),
              subtitle: Text(widget.entry.clientAddress),
              trailing: const Icon(Icons.location_on),
            ),
          ],
        ),
      ),
    );
  }
}
