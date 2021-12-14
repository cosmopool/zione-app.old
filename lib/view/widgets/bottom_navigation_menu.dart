import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationMenu extends StatefulWidget {
  @override
  _BottomNavigationMenuState createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 0:
          context.go('/agenda');
          break;
        case 1:
          context.go('/add');
          break;
        case 2:
          context.go('/tickets');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.grey[600],
      // selectedItemColor: Colors.grey[600],
      currentIndex: _selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Agenda',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.plusSquare),
          label: 'Adicionar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Tickets',
        ),
      ],
      onTap: _onItemTapped,
    );
  }
}
