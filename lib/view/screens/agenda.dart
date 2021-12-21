import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:date_field/date_field.dart';

import 'package:zione_app/view/widgets/card.dart';
import 'package:zione_app/view/widgets/add_entry.dart';
import 'package:zione_app/view/widgets/bottom_modal.dart';

import 'package:zione_app/model/request.dart' as req;
import 'package:zione_app/model/agenda_entry.dart' as agenda;

class AgendaPage extends StatefulWidget {
  @override
  _AgendaPageState createState() => _AgendaPageState();
}

// class _AgendaPageState extends State<AgendaPage> {
//   final List _contentList = [];
//   bool _isLoading = true;

//   Future<void> getAgendaEntries() async {
//     await req.getContent('agenda').then((res) {
//       var temp = res['Result'];
//       temp.forEach((e) {
//         _contentList.add(agenda.AgendaEntry(e));
//       });
//     });

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getAgendaEntries();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: const Text('Agenda'),
//         backgroundColor: Colors.white,
//         centerTitle: false,
//         elevation: 1,
//         foregroundColor: Colors.black,
//       ),
//       // body: Center(),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: _contentList.length,
//               itemBuilder: (context, index) {
//                 return EntryCard(entry: _contentList[index]);
//               }),
//       bottomNavigationBar: BottomNavigationMenu(),
//     );
//   }
// }

class _AgendaPageState extends State<AgendaPage> {
  final List _contentList = [];
  final Map _entryIndexedByDate = {};
  bool _isLoading = true;

  void indexEntryByDate(entry) {
        final date = entry.date;

        if (_entryIndexedByDate[date] == null) {
          _entryIndexedByDate[date] = [];
        }

        _entryIndexedByDate[date].add(entry);
  }

  Future<void> fetchAgendaEntries() async {
    await req.getContent('agenda').then((res) {
      var temp = res['Result'];
      temp.forEach((e) {
        final entry = agenda.AgendaEntry(e);
        _contentList.add(entry);

        indexEntryByDate(entry);
      });
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAgendaEntries();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _contentList.length,
            itemBuilder: (context, index) {
              return EntryCard(entry: _contentList[index]);
            });
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showBottomAutoSizeModal(context, EntryForm());
      },
      label: const Text('Adicionar'),
      icon: const Icon(FontAwesomeIcons.plus),
    );
  }
}
