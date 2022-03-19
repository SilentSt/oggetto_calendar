import 'package:flutter/material.dart';
import 'package:oggetto_calendar/ui/constants/constants.dart' as constants;
import 'package:oggetto_calendar/logic/controllers.dart' as controllers;
import 'calendar.dart';

class Profile extends StatelessWidget{
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
                GestureDetector(child: SizedBox(height: 350,child: Image.network("http://images.shoutwiki.com/ytp/1/1c/%D0%93%D0%BB%D0%B0%D0%B4_%D0%92%D0%B0%D0%BB%D0%B0%D0%BA%D0%B0%D1%81.jpg"))),
                const SizedBox(height: 10,),
                TextField(
                  controller: controllers.Controllers.profileEmailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: constants.AppStrings.emailHint,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: controllers.Controllers.profileNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: constants.AppStrings.nameHint,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: controllers.Controllers.profilePhoneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: constants.AppStrings.phoneHint,
                  ),
                ),
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
        onTap: (index){
          switch(index){
            case 0:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Calendar()));
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
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