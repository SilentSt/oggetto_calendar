import 'package:oggetto_calendar/logic/controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences _prefs;

  LocalStorage() {
    _initPrefs();
  }

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveLP() async {
    await _prefs.setStringList("LP", [
      Controllers.loginController.text,
      Controllers.passwordController.text
    ]);
  }

  Future<bool> loadLP() async {
    if(_prefs.containsKey("LP")){
      var lp = _prefs.getStringList("LP");
      Controllers.loginController.text = lp![0];
      Controllers.passwordController.text = lp[1];
      return true;
    }
    return false;
  }
}
