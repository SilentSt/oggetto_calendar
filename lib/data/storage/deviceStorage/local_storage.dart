import 'package:oggetto_calendar/logic/controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {


  static void saveLP() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setStringList("LP", [
      Controllers.loginController.text,
      Controllers.passwordController.text
    ]);
  }

  static Future<bool> loadLP() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if(_prefs.containsKey("LP")){
      var lp = _prefs.getStringList("LP");
      Controllers.loginController.text = lp![0];
      Controllers.passwordController.text = lp[1];
      return true;
    }
    return false;
  }
}
