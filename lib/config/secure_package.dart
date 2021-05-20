import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurePackage {
  static final _storage = FlutterSecureStorage();
  static const _token = null;

  static Future setUserToken(String token) async {
    await _storage.write(key: _token, value: token);
  }

  static Future deleteToken() async {
    await _storage.deleteAll();
  }

  static Future<String> getUserToken() async {
    final token2 = await _storage.read(key: _token);
    return token2;
  }
}
