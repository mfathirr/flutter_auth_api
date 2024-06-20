import 'package:flutter/material.dart';
import 'package:flutter_auth_api/provider/auth_provider.dart';
import 'package:flutter_auth_api/service/auth_service.dart';
import 'package:flutter_auth_api/ui/login_initial_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Provider(
      create: (BuildContext context) =>
          AuthProvider(authService: AuthService()),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Name"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Email"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Password"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    authProvider.isLoadingRegister
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () {
                              authProvider.register(
                                  _nameController.text,
                                  _emailController.text,
                                  _passwordController.text);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginInitialPage()));
                            },
                            child: const Text("Register")),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Login")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
