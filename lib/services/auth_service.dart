import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://parking.visiontic.com.co/api';
  final _secureStorage = const FlutterSecureStorage();

  Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'email': email.trim(),
        'password': password.trim(),
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Guardar token seguro
      await _secureStorage.write(key: 'token', value: data['token']);

      // Guardar usuario no sensible
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('name', data['user']['name']);
      prefs.setString('email', data['user']['email']);

      return true;
    } else if (response.statusCode == 401) {
      throw Exception('Credenciales incorrectas');
    } else {
      throw Exception('Error del servidor (${response.statusCode})');
    }
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'token');
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<bool> isLoggedIn() async {
    final token = await _secureStorage.read(key: 'token');
    return token != null;
  }
}


