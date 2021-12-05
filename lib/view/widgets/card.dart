import 'package:flutter/material.dart';

class CardContracted extends StatefulWidget {

  @override
  _CardContractedState createState() => _CardContractedState();
}

class _CardContractedState extends State<CardContracted> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            child: Column(
                children: const <Widget>[
                  ListTile(
                      title: Text('18:00'),
                      trailing: Icon(Icons.more_vert),
                  ),
                  ListTile(
                      title: Text('Centro, São José dos Pinhais'),
                      subtitle: Text('Orçamento de motor'),
                  )
                ],
            ),
        ),
    );
  }
}

class CardExtended extends StatefulWidget {

  @override
  _CardExtendedState createState() => _CardExtendedState();
}

class _CardExtendedState extends State<CardExtended> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(
              title: Text('13:00'),
              trailing: Icon(Icons.create),
            ),
            ListTile(
                title: Text('Adriane Bosson'),
                subtitle: Text('Orçamento de motor'),
                trailing: Icon(Icons.phone),
            ),
            ListTile(
                title: Text('Rua Almir, 156'),
                subtitle: Text('Centro, São José dos Pinhais'),
                trailing: Icon(Icons.location_on),
            ),
          ],
        ),
      ),
    );
  }
}
