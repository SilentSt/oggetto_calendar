import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oggetto_calendar/data/storage/tempStorage/device_info.dart';
import 'package:oggetto_calendar/ui/scenes/profile.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:oggetto_calendar/ui/constants/constants.dart' as constants;

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat curFormat = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  List<String> currentDayEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    color: constants.AppColors.baseColor,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: constants.AppColors.textColor, width: 1)),
                      child: TableCalendar(
                        locale: "ru_RU",
                        firstDay: DateTime.utc(2000, 1, 1),
                        lastDay: DateTime.utc(2040, 12, 31),
                        focusedDay: focusedDay,
                        calendarFormat: curFormat,
                        onFormatChanged: (format) {
                          setState(() {
                            curFormat = format;
                          });
                        },
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        availableGestures: AvailableGestures.horizontalSwipe,
                        selectedDayPredicate: (day) {
                          return isSameDay(focusedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            this.focusedDay = selectedDay;
                            this.focusedDay = focusedDay;
                            currentDayEvents =
                                _getEventsForDay(this.focusedDay);
                          });
                        },
                        headerStyle: const HeaderStyle(
                            decoration: BoxDecoration(
                                color: constants.AppColors.shadowColor)),
                        calendarStyle: CalendarStyle(
                          holidayTextStyle: const TextStyle(
                              color: constants.AppColors.weekendColor),
                          weekendTextStyle: const TextStyle(
                              color: constants.AppColors.weekendColor),
                          isTodayHighlighted: true,
                          todayTextStyle: const TextStyle(
                              color: constants.AppColors.textColor),
                          todayDecoration: BoxDecoration(
                              border: Border.all(
                                  color: constants.AppColors.weekendColor,
                                  width: 2),
                              shape: BoxShape.circle),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle:
                              TextStyle(color: constants.AppColors.textColor),
                          weekendStyle: TextStyle(
                              color: constants.AppColors.weekendColor),
                        ),
                        eventLoader: (day) {
                          return _getEventsForDay(day);
                        },
                        onHeaderTapped: (dateTime) async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    content: Container(
                                        color: constants.AppColors.baseColor,
                                        width: DeviceInfo.screenSize.width - 40,
                                        height:
                                            DeviceInfo.screenSize.height - 120,
                                        child: GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent: 200,
                                                    childAspectRatio: 3 / 2,
                                                    crossAxisSpacing: 20,
                                                    mainAxisSpacing: 20),
                                            itemCount: 30,
                                            itemBuilder: (ctx, index) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: constants
                                                      .AppColors.selectedColor,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      focusedDay = DateTime.utc(
                                                          DateTime.now().year -
                                                              15 +
                                                              index,
                                                          DateTime.now().month,
                                                          DateTime.now().day);
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      (DateTime.now().year -
                                                              15 +
                                                              index)
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })));
                              });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    width: DeviceInfo.screenSize.width - 20,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: constants.AppColors.textColor, width: 1)),
                    child: currentDayEvents.isEmpty
                        ? const Text("Сегодня нет событий")
                        : ListView.builder(
                            itemCount: currentDayEvents.length,
                            itemBuilder: (context, index) => Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    showDialog(context: context, builder: (context){
                                      return AlertDialog(
                                        title: Text("Label"),
                                      );
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(currentDayEvents[index]),
                                  ),
                                )
                              ],
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.all(20),
            child: FloatingActionButton(
              onPressed: () {},
            )),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
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

  Map<DateTime, List<String>> events = {
    DateTime.utc(2022, 3, 21): ["Hey"],
    DateTime.utc(2022, 3, 22): ["Hay"],
  };

  List<String> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }
}
