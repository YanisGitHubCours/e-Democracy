import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/clients/http.dart';
import '../utils/token_preferences.dart';

class Auth {
  static Future<Map> login(email, password) async {

    try {
      var body = jsonEncode({"email": "$email", "password": "$password"});
      var url = Uri.parse(loginURL);
      Map<String, dynamic> token;

      var response = await http.post(
        url,
        headers: {
          "Content-Type" : "application/json"
        },
        body: body,
        encoding: Encoding.getByName("utf-8"),
      );

      token = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await TokenSimplePreferences.setToken(token['good'].toString());
      }

      return token;
    } catch (err) {
      Map<String, dynamic> error = {"error": err};
      return error;
    }
  }
}
