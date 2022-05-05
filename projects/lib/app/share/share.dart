import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class Share {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> generateToken() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("token", const Uuid().v4());
  }

  Future<String?> get getToken async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString("token");
  }
}
