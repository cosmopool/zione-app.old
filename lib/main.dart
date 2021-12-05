import 'package:flutter/material.dart';
import 'package:zione_app/view/screens/login.dart';
// import 'package:zione_app/view/screens/tickets.dart';
// import 'package:zione_app/view/screens/settings.dart';
import 'package:zione_app/view/screens/agenda.dart';
import 'package:go_router/go_router.dart';

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
        path: '/agenda',
        builder: (context, state) => AgendaPage(),
      ),
    ],
  );
}
