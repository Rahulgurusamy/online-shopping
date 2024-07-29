import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  late String _email;
  late String _password;

  String get email => _email;
  String get password => _password;

  User get user => User(
        name: 'Rahul',
        email: 'rahul@gmail.com',
        image: 'assets/photo1.png',
      );

  Future<bool> signup(String email, String password, String phone) async {
    _email = email;
    _password = password;
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'password', value: password);
    await _storage.write(key: 'phone', value: phone);
    notifyListeners();
    return true;
  }

  Future<bool> login(String email, String password) async {
    String? storedEmail = await _storage.read(key: 'email');
    String? storedPassword = await _storage.read(key: 'password');
    if (email == storedEmail && password == storedPassword) {
      _email = email;
      _password = password;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _email = '';
    _password = '';
    await _storage.deleteAll();
    notifyListeners();
  }

  Future<bool> changePassword(String currentPassword, String newPassword) async {
    await Future.delayed(const Duration(seconds: 2));
    return currentPassword == 'password';
  }
}

class User {
  final String name;
  final String email;
  final String image;

  User({
    required this.name,
    required this.email,
    required this.image,
  });
}
