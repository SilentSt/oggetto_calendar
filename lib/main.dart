import 'package:flutter/material.dart';
import 'package:oggetto_calendar/ui/scenes/auth.dart';
import 'package:oggetto_calendar/data/storage/tempStorage/device_info.dart';

void main() {
  runApp(const MaterialApp(home: InitialPage()));
}

class InitialPage extends StatelessWidget{
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DeviceInfo.screenSize = MediaQuery.of(context).size;
    return const Auth();
  }

}