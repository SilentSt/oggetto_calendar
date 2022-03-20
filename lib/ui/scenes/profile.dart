import 'package:flutter/material.dart';
import 'package:oggetto_calendar/data/storage/tempStorage/temp_data.dart';
import 'package:oggetto_calendar/logic/functions.dart';
import 'package:oggetto_calendar/ui/constants/constants.dart' as constants;
import 'package:oggetto_calendar/logic/controllers.dart' as controllers;
import 'calendar.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                    child: SizedBox(
                        height: 350,
                        child: Image.network(TempData.me.photoPath))),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onSubmitted: (str) async {
                    await Functions.updateProfile();
                  },
                  controller: controllers.Controllers.profileEmailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: constants.AppStrings.emailHint,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onSubmitted: (str) async {
                    await Functions.updateProfile();
                  },
                  controller: controllers.Controllers.profileNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: constants.AppStrings.nameHint,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controllers.Controllers.profilePhoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: constants.AppStrings.phoneHint,
                  ),
                  onSubmitted: (str) async {
                    await Functions.updateProfile();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () async {
                      if (TempData.me.telegramStatus) {
                        return;
                      }
                      print(TempData.tgLink);
                      launch(TempData.tgLink);
                    },
                    child: Text(
                      TempData.me.telegramStatus
                          ? "Телеграмм привязан"
                          : "Привязать телеграмм",
                      style: TextStyle(
                          color: TempData.me.telegramStatus
                              ? Colors.grey
                              : Colors.blue),
                    )),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 1,
        onTap: (index) async {
          switch (index) {
            case 0:
              TempData.selectedEvents.clear();
              await Functions.getEvents(
                  DateTime.utc(DateTime.now().year, DateTime.now().month, 0),
                  DateTime.utc(DateTime.now().year, DateTime.now().month+1, 0));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Calendar()));
              break;
            case 1:
              TempData.selectedEvents.clear();
              await Functions.openProfile();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
