import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:zione_app/features/entry_card/card.dart';
import 'package:zione_app/features/entry_feed/add_ticket.dart';
import 'package:zione_app/features/entry_feed/feed_repository.dart';
import 'package:zione_app/features/bottom_modal/bottom_modal.dart';

import 'package:zione_app/core/constants.dart';

class TicketsPage extends StatefulWidget {
  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  late List _contentList;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    context.read<FeedRepository>().fetchEntries(Endpoint.tickets);
  }

  @override
  Widget build(BuildContext context) {
    _contentList = context.watch<FeedRepository>().listOfEntries;
    _isLoading = context.watch<FeedRepository>().isLoading;

    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _contentList.length,
            itemBuilder: (context, index) {
              return TicketCard(ticket: _contentList[index]);
            },
          );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        showBottomAutoSizeModal(context, TicketForm());
      },
      label: const Text('Adicionar'),
      icon: const Icon(FontAwesomeIcons.plus),
    );
  }
}

// class _TicketsPageState extends State<TicketsPage> {
//   final List _contentList = [];
//   bool _isLoading = true;

//   Future<void> getContent() async {
//     await req.getContent('tickets').then((res) {
//       var temp = res['Result'];
//       temp.forEach((e) {
//         _contentList.add(Ticket(e));
//       });
//     });

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;

//       switch (index) {
//         case 0:
//           context.go('/agenda');
//           break;
//         case 1:
//           context.go('/add');
//           break;
//         case 2:
//           context.go('/tickets');
//           break;
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getContent();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: const Text('Tickets'),
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
//                 return TicketCard(ticket: _contentList[index]);
//               }),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           addTicketModal(context);
//         },
//         label: const Text('Adicionar'),
//         icon: const Icon(FontAwesomeIcons.plus),
//       ),
//     bottomNavigationBar: BottomNavigationBar(
//       unselectedItemColor: Colors.grey[600],
//       // selectedItemColor: Colors.grey[600],
//       currentIndex: _selectedScreenIndex,
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Agenda',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(FontAwesomeIcons.plusSquare),
//           label: 'Adicionar',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.school),
//           label: 'Tickets',
//         ),
//       ],
//       onTap: _onItemTapped,
//     ),
//     );
//   }
// }
