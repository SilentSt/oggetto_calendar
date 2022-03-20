import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:oggetto_calendar/data/api.dart';
import 'package:oggetto_calendar/data/models/events.dart';
import 'package:oggetto_calendar/data/models/user.dart';
import 'package:oggetto_calendar/data/storage/deviceStorage/local_storage.dart';
import 'package:oggetto_calendar/data/storage/tempStorage/temp_data.dart';
import 'package:oggetto_calendar/logic/controllers.dart';

class Functions {
  static Future<String> login() async {
    //SmartDialog.showLoading(backDismiss: false);
    var data = {
      'username': Controllers.loginController.text,
      'password': Controllers.passwordController.text
    };
    var response = await API.login(data);
    if (response.keys.first > 299) {
      return jsonDecode(response.values.first)['detail'];
    }
    Map<String, dynamic> respData = jsonDecode(response.values.first);
    TempData.userId = respData['user_id'].toString();
    TempData.token = respData['access_token'].toString();
    if(respData['telegram_status']==true)
      {
        await Functions.getTgLink();
      }
    LocalStorage.saveLP();
    await Future.delayed(const Duration(milliseconds: 500));
    return "SUCCESS";
  }

  static Future<String> registrate() async {
    var user = PostUser(
        email: Controllers.regEmailController.text,
        name: Controllers.regNameController.text,
        password: Controllers.regPasswordController.text,
        phone: Controllers.regPhoneController.text);
    var response = await API.createUser(jsonEncode(user.toJson()));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode > 299) {
      return jsonDecode(response.body)['detail'];
    }
    return "SUCCESS";
  }

  static Future<String> openProfile() async {
    var response = await API.me();
    if (response.statusCode > 299) {
      return jsonDecode(response.body)['detail'];
    }
    var user = GetUser.fromJson(jsonDecode(response.body));
    Controllers.profileEmailController.text = user.email;
    Controllers.profileNameController.text = user.name;
    Controllers.profilePhoneController.text = user.phone;
    TempData.me = user;
    return "SUCCESS";
  }

  static Future<String> updateProfile() async {
    var user = PatchUser(
        phone: Controllers.profilePhoneController.text,
        name: Controllers.profileNameController.text,
        email: Controllers.profileEmailController.text);
    API.patchUser(jsonEncode(user.toJson()), TempData.me.id);

    return "SUCCESS";
  }

  static Future<String> getEvents(DateTime from, DateTime to) async {
    var res = await API.getDatedEvents(from, to);
    List<dynamic> events = jsonDecode(utf8.decode(res.bodyBytes));
    TempData.curMonthEvents.clear();
    for (Map<String, dynamic>event in events) {
      TempData.curMonthEvents.add(GetEvents.fromJson(event));
    }
    TempData.selectedEvents.clear();
    for (var ev in TempData.curMonthEvents) {
      if (!TempData.selectedEvents.containsKey(ev.date)) {
        TempData.selectedEvents[ev.date] = [];
      }
      TempData.selectedEvents[ev.date]!.add(ev);
    }
    return "SUCCESS";
  }

  static Future<String> createEvent() async {
    print(TempData.newEventDate);
    var event = PostEvents(title: Controllers.newEventTitleController.text,
        description: Controllers.newEventDescriptionController.text,
        date: TempData.newEventDate,
        users: TempData.usersAddEvent
    );
    var resp = await API.postEvents(jsonEncode(event.toJson()));
    if (resp.statusCode > 299) {
      return jsonDecode(resp.body)['detail'];
    }

    return "SUCCESS";
  }

  static Future<String> getUsers() async
  {
    var resp = await API.getUsers();
    if (resp.statusCode > 299) {
      return jsonDecode(resp.body)['detail'];
    }
    List<dynamic> data_s = jsonDecode(utf8.decode(resp.bodyBytes));
    print(data_s);
    List<GetUser> users = [];
    for (Map<String, dynamic> data in data_s) {
      users.add(GetUser.fromJson(data));
    }

    TempData.users = users;
    print(TempData.users);
    return "SUCCESS";
  }

  static Future<String> getTgLink() async{
    var resp = await API.createTgLink();
    if (resp.statusCode > 299) {
      return jsonDecode(resp.body)['detail'];
    }
    var data = jsonDecode(resp.body);
    TempData.tgLink = data['link'];
    return "SUCCESS";
  }
}
