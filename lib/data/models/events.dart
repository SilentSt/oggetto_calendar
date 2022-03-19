import 'package:oggetto_calendar/data/models/user.dart';

class GetEvents {
  final int id;
  final String title;
  final String description;
  final String link;
  final DateTime date;
  final DateTime createdAt;
  final List<GetUser> users;

  GetEvents(
      {required this.id,
      required this.title,
      required this.description,
      required this.link,
      required this.date,
      required this.createdAt,
      required this.users});

  GetEvents.fromJson(Map<String, dynamic> mappedData)
      : id = mappedData['id'],
        title = mappedData['title'],
        description = mappedData['description'],
        link = mappedData['chat_link']??"",
        date = DateTime.parse(mappedData['date']),
        createdAt = DateTime.parse(mappedData['created_at']),
        users = List.generate(mappedData['users'].length,
            (index) => GetUser.fromJson(mappedData['users'][index]));

  @override
  String toString() => title;

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
