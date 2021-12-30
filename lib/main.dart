import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:zione_app/screens/login.dart';
import 'package:zione_app/screens/tickets.dart';
// import 'package:zione_app/screens/settings.dart';
import 'package:zione_app/screens/main_screen.dart';
import 'package:zione_app/screens/agenda.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'GoRouter Example',
      );

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => MainPage(),
      ),
      GoRoute(
        path: '/agenda',
        builder: (context, state) => AgendaPage(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => TicketsPage(),
      ),
      GoRoute(
        path: '/tickets',
        builder: (context, state) => TicketsPage(),
      ),
    ],
  );
}
