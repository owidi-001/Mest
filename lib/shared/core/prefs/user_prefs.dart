import 'dart:convert';

import 'package:mest/shared/common/utils/utils.dart';
import 'package:mest/shared/data/models/auth/auth_model.dart';
import 'package:mest/shared/data/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // load shared preferences
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

// Load User data
  Future<LoginData?> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? user = prefs.getString(USER);
    String? authToken = prefs.getString(TOKEN);

    if (user != null && authToken != null) {
      return LoginData(
        user: User.fromJson(
          json.decode(user),
        ),
        token: authToken,
      );
    }
    return null;
  }

  // Store user
  void storeLoginData(LoginData data) async {
    await SharedPreferences.getInstance().then((pref) {
      pref.setString(USER, jsonEncode(data.user.toJson()));
      pref.setString(TOKEN, data.token);
    });
  }

  // Retrieve auth token from prefs
  Future<String> getToken() async {
    String data = await prefs.then((value) => value.getString(TOKEN)) ?? "";
    return data;
  }

  void removeUser() async {
    await prefs.then((value) => value.remove(USER));
    await prefs.then((value) => value.remove(TOKEN));
  }
}
