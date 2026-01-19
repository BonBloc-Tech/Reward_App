import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();

  static const String _tokenKey = 'auth_token';
  static const String _loginKey = 'is_logged_in';

  // Save token
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _loginKey, value: 'true');
  }

  // Read token
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  // Check login status
  Future<bool> isLoggedIn() async {
    final value = await _storage.read(key: _loginKey);
    return value == 'true';
  }

  // Clear session
  Future<void> logout() async {
    await _storage.deleteAll();
  }
}
