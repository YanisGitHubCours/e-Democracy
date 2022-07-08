import 'dart:convert';
import 'dart:io';
import 'package:backoffice_flutter/constants/clients/http.dart';
import 'package:backoffice_flutter/models/survey.dart';

import 'package:backoffice_flutter/utils/token_preferences.dart';
import 'package:http/http.dart' as http;

class Polls {
  static Future<List<Survey>?> getAllPollsDesc() async {
    final response = await http.post(
      Uri.parse(getPollsDesc),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
            TokenSimplePreferences.getToken('token').toString(),
      },
    );
    if (response.statusCode == 400) return null;

    if (response.statusCode != 200) throw Error();

    final jsonBody = json.decode(response.body);
    final List<Survey> surveys = (jsonBody as List).map((survey) => Survey.fromJson(survey)).toList();
    return surveys;

  }

  static Future<List<Survey>?> getPollsByUser(String? id) async {
    var body = jsonEncode({"id": id});
    final response = await http.post(
      Uri.parse(getPollsUser),
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader:
            TokenSimplePreferences.getToken('token').toString(),
      },
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );

    if (response.statusCode == 400) return null;

    if (response.statusCode != 200) throw Error();

    final jsonBody = json.decode(response.body);
    final List<Survey> surveys =
        (jsonBody as List).map((survey) => Survey.fromJson(survey)).toList();
    return surveys;
  }

  static Future<dynamic> deleteSurvey(String? id) async {
    var body = jsonEncode({"id": id});
    final response = await http.delete(
      Uri.parse(deletePollsId),
      headers: {
        "Content-type" : "application/json",
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

  static Future countPolls() async {
    final response = await http.get(
      Uri.parse(getAllPolls),
      headers: {
        HttpHeaders.authorizationHeader:
            TokenSimplePreferences.getToken('token').toString(),
      },
    );

    if (response.statusCode != 200) {
      throw Error();
    }

    final jsonBody = json.decode(response.body);
    final counter = jsonBody.length;

    return counter;
  }
}
