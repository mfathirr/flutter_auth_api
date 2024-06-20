import 'package:flutter_auth_api/model/register_response.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://story-api.dicoding.dev/v1';

  Future<RegisterResponse> register(String name, String email, String password) async {
    const String register = '/register';
    final response = await http.post(Uri.parse('$baseUrl$register'), body: {
      "name": name,
      "email": email,
      "password": password
    });

    if (response.statusCode == 201) {
      print(response.body);
      return RegisterResponse.fromJson(response.body);
    } else {
      print(response.body);
      throw Exception('Failed to load data');
    }
  }
}
