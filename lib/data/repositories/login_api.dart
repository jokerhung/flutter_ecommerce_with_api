import 'dart:convert';

import 'package:http/http.dart';
import 'package:shop_app/constants.dart';

import '../models/login_resp.dart';

class LoginApi {
  Future<LoginResp> login(String username, String password) async {
    final response = await post(
      Uri.parse(ApiBaseUrl + ApiLogin),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    ).timeout(const Duration(seconds: ApiTimeout));

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return LoginResp.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to login.');
    }
  }
}
