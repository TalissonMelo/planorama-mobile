import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:liberbox_mobile/src/auth/model/user_login.dart';

class UtilService {
  final storage = const FlutterSecureStorage();

  Future<void> saveLocalUser({
    required String key,
    required UserLogin login,
  }) async {
    String userJson = login.toJson();
    await storage.write(key: key, value: userJson);
  }

  Future<UserLogin?> getLocalUser({required String key}) async {
    String? userJson = await storage.read(key: key);
    if (userJson != null) {
      return UserLogin.fromJson(userJson);
    }
    return null;
  }

  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }

  String encodePassword(String password) {
    return base64Encode(utf8.encode(password));
  }
}
