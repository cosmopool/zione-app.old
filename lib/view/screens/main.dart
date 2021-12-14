import 'package:flutter/material.dart';
import 'package:zione_app/view/widgets/card.dart';
import 'package:zione_app/view/widgets/appbar.dart';
import 'package:zione_app/view/widgets/bottom_navigation_menu.dart';
import 'package:zione_app/model/request.dart' as req;
import 'package:zione_app/model/agenda_entry.dart' as agenda;

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  final List _contentList = [];
  bool _isLoading = true;

  Future<void> getAgendaEntries() async {
    await req.getContent('agenda').then((res) {
      var temp = res['Result'];
      temp.forEach((e) {
        _contentList.add(agenda.AgendaEntry(e));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: _screens[_selectedScreenIndex]["tile"],
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      // body: Center(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _screens[_selectedScreenIndex]["screen"];
          }),
      bottomNavigationBar: BottomNavigationMenu(),
    );
  }
}
