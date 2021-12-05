import 'package:flutter/material.dart';
import 'package:zione_app/view/widgets/card.dart';

class AgendaPage extends StatefulWidget {

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agenda'),
      ),
      body: Column(
        children: <Widget>[
          CardContracted(),
          CardExtended(),
        ],
      ),
    );
  }
}
