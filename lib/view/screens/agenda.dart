import 'package:flutter/material.dart';
import 'package:zione_app/view/widgets/card.dart';
// import 'package:zione_app/view/widgets/appbar.dart';
import 'package:zione_app/model/request.dart' as req;
import 'package:zione_app/model/agenda_entry.dart' as agenda;
import 'package:go_router/go_router.dart';

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
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          () => GoRouter.of(context).go('/settings');
          break;
        case 1:
          () => GoRouter.of(context).go('/agenda');
          break;
        case 2:
          () => GoRouter.of(context).go('/tickets');
          break;
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Agenda'),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      // body: Center(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _contentList.length,
              itemBuilder: (context, index) {
                return EntryCard(entry: _contentList[index]);
              }),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Agenda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tickets',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
