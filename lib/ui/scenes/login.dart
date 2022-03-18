import 'dart:ui';
import 'package:oggetto_calendar/data/storage/tempStorage/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oggetto_calendar/ui/constants/constants.dart' as constants;
import 'package:oggetto_calendar/logic/controllers.dart' as controllers;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.AppColors.baseColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(color: constants.AppColors.shadowColor)
              ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("img/Frame.png",width: DeviceInfo.screenSize.width-20,),
                  const SizedBox(height: 10,),
                  TextField(
                    controller: controllers.Controllers.loginController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: constants.AppStrings.emailHint,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controllers.Controllers.passwordController,
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
                    onPressed: () => {},
                    child: const Text(constants.AppStrings.signIn,
                        style: TextStyle(color: constants.AppColors.textColor)),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(DeviceInfo.screenSize.width - 20, 50),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            constants.AppColors.accentColor),
                        side: MaterialStateProperty.all(const BorderSide(
                            color: constants.AppColors.textColor)),),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}