import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oggetto_calendar/data/storage/tempStorage/device_info.dart';
import 'package:oggetto_calendar/ui/constants/constants.dart' as constants;
import 'package:oggetto_calendar/logic/controllers.dart' as controllers;

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onPressed: () => {},
                  child: const Text(constants.AppStrings.regAccountText,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
