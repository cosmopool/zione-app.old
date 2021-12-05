import 'package:flutter/material.dart';
import 'package:zione_app/view/screens/agenda.dart' as agenda;

class MenuBottomBar extends StatefulWidget {

  @override
  _MenuBottomBarState createState() => _MenuBottomBarState();
}

class _MenuBottomBarState extends State<MenuBottomBar> {
  int _selectedIndex = 0;


  static const List<Widget> _widgetOptions = <Widget>[
    agenda.AgendaPage(),
    tickets.TicketsPage(),
    settings.SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
