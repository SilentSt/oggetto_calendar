import 'package:oggetto_calendar/data/models/events.dart';
import 'package:oggetto_calendar/data/models/user.dart';

class TempData {
  static String token = '';
  static String userId = '';
  static List<GetUser> users = [];
  static GetUser me = GetUser(
      email: "email",
      name: "name",
      phone: "phone",
      id: 0,
      roleId: 0,
      role: Role(id: 1, title: 'сотрудник'),
      telegram:
          Telegram(createdAt: DateTime.now(), userHash: '', telegramId: 0),
      telegramStatus: false,
      photoPath: "photoPath");
  static List<GetEvents> curDayEvents = [];
  static List<GetEvents> curMonthEvents = [];
  static Map<DateTime, List<GetEvents>> selectedEvents={};
  static List<int> usersAddEvent = [];
  static String displayedDate = "Дата события";
  static DateTime newEventDate = DateTime.now();
  static String tgLink ="";
}
