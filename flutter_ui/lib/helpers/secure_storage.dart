import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  // Token kaydetme
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'jwt_token', value: token);
  }

  // Tokeni alma
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'jwt_token');
  }

  // Tokeni silme
  void deleteToken() async {
    await _secureStorage.delete(key: 'jwt_token');
  }
}


