import 'package:flutter/material.dart';
import 'package:oggetto_calendar/data/storage/deviceStorage/local_storage.dart';
import 'package:oggetto_calendar/logic/controllers.dart';
import 'package:oggetto_calendar/logic/functions.dart';
import 'package:oggetto_calendar/ui/scenes/auth.dart';
import 'package:oggetto_calendar/data/storage/tempStorage/device_info.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:oggetto_calendar/ui/scenes/calendar.dart';

void main() {
  initializeDateFormatting()
      .then((_) => runApp(const MaterialApp(home: InitialPage())));
}

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceInfo.screenSize = MediaQuery.of(context).size;
    bool _logged = false;
    //tryAuth();
    if (Controllers.loginController.text.isNotEmpty &&
        Controllers.passwordController.text.isNotEmpty) {
      Functions.login().then((value) => _logged = true);
    }
    return _logged ? const Calendar() : const Auth();
  }

  void tryAuth()async
  {
    await LocalStorage.loadLP();
  }
}
