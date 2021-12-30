import 'package:flutter/material.dart';
// import 'package:zione_app/config/auth.dart' as auth_config;
import 'package:zione_app/features/authentication/authentication_controller.dart' as auth;
// import 'package:zione_app/model/request.dart' as req;
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(child: 
          ElevatedButton(
              onPressed: () async {
                var token = await auth.setToken("kaio", "kaio123");
                if (token ==  true) {
                  // Navigator.pushNamed(context, '/agenda');
                  context.go('/main');
                }
                // print(auth_config.token);
              },
            child: const Text('Login'),
          ),
              )
        ],
      ),
    );
  }
}
