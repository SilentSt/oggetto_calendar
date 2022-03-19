import 'package:flutter/material.dart';

import 'calendar.dart';

class Profile extends StatelessWidget{
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 350,child: Image.network("http://images.shoutwiki.com/ytp/1/1c/%D0%93%D0%BB%D0%B0%D0%B4_%D0%92%D0%B0%D0%BB%D0%B0%D0%BA%D0%B0%D1%81.jpg")),
          TextField(),
          TextField(),
          TextField(),
        ],
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