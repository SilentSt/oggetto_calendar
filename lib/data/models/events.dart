import 'package:oggetto_calendar/data/models/user.dart';

class GetEvents {
  final int id;
  final String title;
  final String description;
  final String link;
  final DateTime date;
  final DateTime createdAt;
  final GetUser eventUsers;
  final GetUser users;

  GetEvents(
      {required this.id,
      required this.title,
      required this.description,
      required this.link,
      required this.date,
      required this.createdAt,
      required this.eventUsers,
      required this.users});

  GetEvents.fromJson(Map<String, dynamic> mappedData)
      : id = mappedData['id'],
        title = mappedData['title'],
        description = mappedData['description'],
        link = mappedData['link'],
        date = DateTime.parse(mappedData['date']),
        createdAt = DateTime.parse(mappedData['created_at']),
        eventUsers = GetUser.fromJson(mappedData['event_users']),
        users = GetUser.fromJson(mappedData['users']);
}

class PostEvents {
  final String title;
  final String description;
  final String link;
  final DateTime date;

  PostEvents({
    required this.title,
    required this.description,
    required this.link,
    required this.date,
  });

  PostEvents.fromJson(Map<String, dynamic> mappedData)
      : title = mappedData['title'],
        description = mappedData['description'],
        link = mappedData['link'],
        date = DateTime.parse(mappedData['date']);
}

class PatchEvents {
  final String title;
  final String description;
  final String link;
  final DateTime date;
  final GetUser users;

  PatchEvents(
      {required this.title,
      required this.description,
      required this.link,
      required this.date,
      required this.users});

  PatchEvents.fromJson(Map<String, dynamic> mappedData)
      : title = mappedData['title'],
        description = mappedData['description'],
        link = mappedData['link'],
        date = DateTime.parse(mappedData['date']),
        users = GetUser.fromJson(mappedData['users']);

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'link': link,
        'date': date,
        'users': users.toJson()
      };
}
