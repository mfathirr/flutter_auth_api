import 'package:flutter/material.dart';
import 'package:flutter_auth_api/service/auth_service.dart';

enum ResultState { loading, success, failed }

class AuthProvider extends ChangeNotifier {
  final AuthService authService;

  AuthProvider({required this.authService});

  bool isLoadingRegister = false;

  Future<void> register(String name, String email, String password) async {
    isLoadingRegister = true;
    final regis = await authService.register(name, email, password);
    print(regis);
    notifyListeners();

    isLoadingRegister = false;
    notifyListeners();
  }
}
