import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:oggetto_calendar/data/api.dart';
import 'package:oggetto_calendar/data/models/user.dart';
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
    await Future.delayed(const Duration(milliseconds: 500));
    return "SUCCESS";
  }

  static Future<String> registrate() async {
    var user = PostUser(email: Controllers.regEmailController.text,
      name: Controllers.regNameController.text,
      password: Controllers.regPasswordController.text,
      phone: Controllers.regPhoneController.text
    );
    var response = await API.createUser(jsonEncode(user.toJson()));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if(response.statusCode>299)
      {
        return jsonDecode(response.body)['detail'];
      }
    return "SUCCESS";
  }
}
