import 'dart:convert';
import 'dart:io';
import 'package:backoffice_flutter/constants/clients/http.dart';

import 'package:backoffice_flutter/utils/token_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class Users {
  static Future<List<User>> getUsers() async{
    TokenSimplePreferences.getToken('token').toString();
    final response = await http.post(
      Uri.parse(getAllUsers),
      headers: {
        HttpHeaders.authorizationHeader: TokenSimplePreferences.getToken('token').toString(),
      },
    );

    if (response.statusCode != 200) {
      throw Error();
    }

    final jsonBody = json.decode(response.body);

    final List<User> users = (jsonBody as List).map((user) => User.fromJson(user)).toList();

    return users;
  }

  static Future countUsers() async {
    TokenSimplePreferences.getToken('token').toString();
    final response = await http.post(
      Uri.parse(getAllUsers),
      headers: {
        HttpHeaders.authorizationHeader: TokenSimplePreferences.getToken('token').toString(),
      },
    );

    if (response.statusCode != 200) {
      throw Error();
    }

    final jsonBody = json.decode(response.body);
    final counter = jsonBody.length;

    return counter;
  }

  static Future<dynamic> deleteUser(String? id) async {
    var body = jsonEncode({"id": "$id"});
    final response = await http.delete(
      Uri.parse(delUserById),
      headers: {
        HttpHeaders.authorizationHeader: TokenSimplePreferences.getToken('token').toString(),
      },
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode != 200) {
      throw Error();
    }

    if (response.statusCode == 200) {
      return true;
    }

  }
}