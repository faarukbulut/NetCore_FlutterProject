import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SecureStorage{

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Token kaydetme
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'jwt_token', value: token);
  }

  // Tokeni alma
  Future<String?> getToken() async {
    final token = await _secureStorage.read(key: 'jwt_token');

    if (token != null && !isAccessTokenExpired(token)) {
      return token;
    } else {
      deleteToken();
      return null;
    }
  }

  // Token süre kontrol
  bool isAccessTokenExpired(String token) {
    final decodedToken = JwtDecoder.decode(token);
    final expirationDate = DateTime.fromMillisecondsSinceEpoch(decodedToken['exp'] * 1000);
    final currentTime = DateTime.now();
    return expirationDate.isBefore(currentTime);
  }

  // Tokeni silme
  void deleteToken() async {
    await _secureStorage.delete(key: 'jwt_token');
  }
}


