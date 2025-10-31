import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _loading = false;
  bool _loggedIn = false;

  bool get loading => _loading;
  bool get loggedIn => _loggedIn;

  Future<void> login(String email, String password) async {
    _loading = true;
    notifyListeners();

    final success = await _authService.login(email, password);
    _loggedIn = success;

    _loading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
    _loggedIn = false;
    notifyListeners();
  }

  Future<void> checkLogin() async {
    _loggedIn = await _authService.isLoggedIn();
    notifyListeners();
  }
}
