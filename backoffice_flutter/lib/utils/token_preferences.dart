import 'package:shared_preferences/shared_preferences.dart';

class TokenSimplePreferences {
  static SharedPreferences? preferences;

  static const _keyToken = 'token';

  static Future init() async => preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async =>
      await preferences?.setString(_keyToken, token);

  static String? getToken(String s) => preferences?.getString(_keyToken);

  static Future<bool>? removeToken(String s) => preferences?.remove(_keyToken);
}
