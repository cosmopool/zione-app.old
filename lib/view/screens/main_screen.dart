import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:zione_app/model/request.dart' as req;
import 'package:zione_app/model/agenda_entry.dart' as entry;

import 'package:zione_app/view/screens/tickets.dart';
import 'package:zione_app/view/screens/tickets.dart' as ticket;
import 'package:zione_app/view/screens/agenda.dart';
import 'package:zione_app/view/screens/agenda.dart' as agenda;

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List _contentList = [];
  bool _isLoading = true;

  Future<void> getAgendaEntries() async {
    await req.getContent('agenda').then((res) {
      var temp = res['Result'];
      temp.forEach((e) {
      // print(e);
        _contentList.add(entry.AgendaEntry(e));
      });
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAgendaEntries();
  }

  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": AgendaPage(), "title": "Agenda", "floatingButton": agenda.FloatingButton()},
    {"screen": AgendaPage(), "title": "Agenda", "floatingButton": null},
    {"screen": TicketsPage(), "title": "Tickets", "floatingButton": ticket.FloatingButton()}
  ];
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]["title"]),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: _screens[_selectedScreenIndex]["screen"],
      floatingActionButton: _screens[_selectedScreenIndex]["floatingButton"],
      // floatingActionButton: ticket.FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[600],
        // selectedItemColor: Colors.grey[600],
        currentIndex: _selectedScreenIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarAlt),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tasks),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tools),
            label: 'Tickets',
          ),
        ],
        onTap: _selectScreen,
      ),
    );
  }
}
