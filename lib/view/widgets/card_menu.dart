import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardMenu extends StatelessWidget {
  final String entryTitle;

  const CardMenu(this.entryTitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(FontAwesomeIcons.trash),
          title: Text('Deletar $entryTitle'),
          onTap: () => print('delete this entry'),
        ),
        ListTile(
          leading: const Icon(FontAwesomeIcons.calendarCheck),
          title: Text("Finalizar $entryTitle"),
          onTap: () => print('closing this entry'),
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
