import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserService extends ChangeNotifier {
  
  final String _baseUrl = 'ap-auth-server.azurewebsites.net';
  final storage = const FlutterSecureStorage();

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      "username": email,
      "password": password,
    };

    final url = Uri.https(_baseUrl, '/api/auth/authenticate/user');

    final resp = await http.post(url, headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',}, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('token')) {
      await storage.write(key: 'token', value: decodedResp['token']);
      return null;
    } else {
      return decodedResp['message'];
    }
  }
  
  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }

}
