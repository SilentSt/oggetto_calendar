class GetUser {
  final String email;
  final String name;
  final String phone;
  final int id;
  final int roleId;
  final Role role;
  final Telegram telegram;
  final bool telegramStatus;

  GetUser(
      {required this.email,
      required this.name,
      required this.phone,
      required this.id,
      required this.roleId,
      required this.role,
      required this.telegram,
      required this.telegramStatus});

  GetUser.fromJson(Map<String, dynamic> mappedData)
      : email = mappedData['email'],
        name = mappedData['name'],
        phone = mappedData['phone'],
        id = mappedData['id'],
        roleId = mappedData['role_id'],
        role = Role.fromJson(mappedData['role']),
        telegram = Telegram.fromJson(mappedData['telegram']),
        telegramStatus = mappedData['telegram_status'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'phone': phone,
        'id': id,
        'role_id': roleId,
        'role': role,
        'telegram': telegram,
        'telegram_status': telegramStatus
      };
}

class PostUser {
  final String email;
  final String name;
  final String phone;
  final String password;
  final int roleId;

  PostUser(
      {required this.email,
      required this.name,
      required this.phone,
      required this.password,
      required this.roleId});

  PostUser.fromJson(Map<String, dynamic> mappedData)
      : name = mappedData['name'],
        email = mappedData['email'],
        phone = mappedData['phone'],
        password = mappedData['password'],
        roleId = mappedData['role_id'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'phone': phone,
        'password': password,
        'role_id': roleId
      };
}

class PatchUser {
  final String email;
  final String name;
  final String phone;

  PatchUser({required this.email, required this.name, required this.phone});

  PatchUser.fromJson(Map<String, dynamic> mappedData)
      : email = mappedData['email'],
        name = mappedData['name'],
        phone = mappedData['phone'];

  Map<String, dynamic> toJson() =>
      {'email': email, 'name': name, 'phone': phone};
}

class Role {
  final int id;
  final String title;

  Role({required this.id, required this.title});

  Role.fromJson(Map<String, dynamic> mappedData)
      : id = mappedData['id'],
        title = mappedData['title'];

  Map<String, dynamic> toJson() => {'id': id, 'title': title};
}

class Telegram {
  final int telegramId;
  final String userHash;
  final DateTime createdAt;

  Telegram(
      {required this.telegramId,
      required this.userHash,
      required this.createdAt});

  Telegram.fromJson(Map<String, dynamic> mappedData)
      : telegramId = mappedData['telegram_id'],
        userHash = mappedData['user_hash'],
        createdAt = mappedData['created_at'];

  Map<String, dynamic> toJson() => {
        'telegram_id': telegramId,
        'user_hash': userHash,
        'created_at': createdAt
      };
}
