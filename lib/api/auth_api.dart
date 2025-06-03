import 'dart:convert';

import 'package:easy_extension/easy_extension.dart';
import 'package:http/http.dart' as http;
import 'package:news_portal/api/api_config.dart';
import 'package:news_portal/api/models/auth.dart';

class AuthApi {
  static Future<Auth?> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await http
          .post(
            Uri.parse(ApiConfig.auth.login),
            body: jsonEncode({
              'email': email, //
              'password': password,
            }),
          )
          .timeout(
            5.toSecond,
            onTimeout: () {
              return http.Response('timeout', 500);
            },
          );
      final statuscode = result.statusCode;
      if (statuscode != 200) return null;

      final body = result.body;
      final data = jsonDecode(body);
      final auth = Auth.fromMap(data);
      Log.green(auth);
      Log.blue('auth 생성 완료');
      return auth;
    } catch (e) {
      Log.red(e);
      return null;
    }
  }
}
