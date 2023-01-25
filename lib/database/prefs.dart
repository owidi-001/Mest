import 'package:mest/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
// Obtain shared preferences.
  final prefs = SharedPreferences.getInstance();

  // Check if boarded
  Future<bool> boarded() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(BOARDED) ?? false;
  }
}
