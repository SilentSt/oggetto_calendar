import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oggetto_calendar/data/storage/tempStorage/device_info.dart';
import 'package:oggetto_calendar/logic/functions.dart';
import 'package:oggetto_calendar/ui/constants/constants.dart' as constants;
import 'package:oggetto_calendar/logic/controllers.dart' as controllers;
import 'package:fluttertoast/fluttertoast.dart' as ft;

import 'auth.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        backgroundColor: constants.AppColors.baseColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset("img/reg.png"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controllers.Controllers.regEmailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: constants.AppStrings.emailHint,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controllers.Controllers.regNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: constants.AppStrings.nameHint,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controllers.Controllers.regPhoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: constants.AppStrings.phoneHint,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controllers.Controllers.regPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: constants.AppStrings.passwordHint,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //add function sign in
                  ElevatedButton(
                    onPressed: () async {
                      var resp = await Functions.registrate();
                      switch (resp) {
                        case "SUCCESS":
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                          controllers.Controllers.loginController.text =
                              controllers.Controllers.regEmailController.text;
                          controllers.Controllers.passwordController.text =
                              controllers
                                  .Controllers.regPasswordController.text;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()),);
                          break;
                        default:
                          ft.Fluttertoast.showToast(msg: resp);
                          break;
                      }
                    },
                    child: const Text(constants.AppStrings.regAccountText,
                        style: TextStyle(color: constants.AppColors.textColor)),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        Size(DeviceInfo.screenSize.width - 20, 50),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          constants.AppColors.accentColor),
                      side: MaterialStateProperty.all(const BorderSide(
                          color: constants.AppColors.textColor)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
