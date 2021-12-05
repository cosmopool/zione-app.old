import 'package:flutter/material.dart';
import 'package:zione_app/view/widgets/card.dart' as appointment;

content(){
  return Container(

  );
}

class AgendaPage extends StatefulWidget {

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          Center(
              child: appointment.Card(),
          ),
        ],
      ),
    );
  }
