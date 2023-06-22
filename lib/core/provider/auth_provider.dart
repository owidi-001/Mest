import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/common/utils/utils.dart';
import 'package:mest/core/prefs/user_prefs.dart';
import 'package:mest/models/auth/auth_model.dart';
import 'package:mest/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = ChangeNotifierProvider((ref) => AuthProvider._());

class AuthProvider with ChangeNotifier {
  AuthProvider._();

  static final instance = AuthProvider._();

  LoadStatus status = LoadStatus.initial;

  User? user;
  String authToken = "";

  void authenticationChanged(LoadStatus status) {
    this.status = status;
    notifyListeners();
  }

  void loginUser({required User user}) {
    this.user = user;
    authToken = user.token;
    status = LoadStatus.success;
    notifyListeners();

    // User has been logged in and can be saved to shared prefs
    LoginData data = LoginData(user: user, token: authToken);

    //save user
    UserPreferences().storeLoginData(data);
  }

  void logout() async {
    user = null;
    authToken = "";
    SharedPreferences.getInstance().then((pref) => pref.clear());
    notifyListeners();
  }

  void initialize({User? user, String? authToken}) {
    this.user = user ?? this.user;
    this.authToken = authToken ?? this.authToken;
  }
}
