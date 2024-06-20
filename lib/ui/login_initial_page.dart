import 'package:flutter/material.dart';
import 'package:flutter_auth_api/ui/login_page.dart';
import 'package:flutter_auth_api/ui/register_page.dart';

class LoginInitialPage extends StatefulWidget {
  const LoginInitialPage({super.key});

  @override
  State<LoginInitialPage> createState() => _LoginInitialPageState();
}

class _LoginInitialPageState extends State<LoginInitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset(
          "assets/image/login-page.jpg",
          height: 600,
          fit: BoxFit.cover,
        ),
        const Text("Sistem Analisa Kerusakan Smartphone"),
      ]),
      floatingActionButton: SizedBox(
          width: MediaQuery.sizeOf(context).width / 2,
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: const Text("Login"))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
