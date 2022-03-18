import 'package:flutter/material.dart';
import 'package:oggetto_calendar/data/storage/tempStorage/device_info.dart';
import 'package:oggetto_calendar/ui/constants/constants.dart' as constants;
import 'package:oggetto_calendar/ui/scenes/register.dart';

import 'login.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.AppColors.baseColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  constants.AppStrings.authLabelText,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Image.asset("img/auth.png"),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()),)
                  },
                  child: const Text(
                    constants.AppStrings.signIn,
                    style: TextStyle(color: constants.AppColors.textColor),
                  ),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        Size(DeviceInfo.screenSize.width - 20, 50),
                      ),
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      backgroundColor: MaterialStateProperty.all(
                          constants.AppColors.windowColor),
                      side: MaterialStateProperty.all(const BorderSide(
                          color: constants.AppColors.textColor))),
                ),
                const SizedBox(height: 15,),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()),)
                  },
                  child: const Text(
                    constants.AppStrings.regAccountText,
                    style: TextStyle(color: constants.AppColors.textColor),
                  ),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        Size(DeviceInfo.screenSize.width - 20, 50),
                      ),
                      shadowColor: MaterialStateProperty.all(Colors.transparent),
                      backgroundColor: MaterialStateProperty.all(
                          constants.AppColors.accentColor),
                      side: MaterialStateProperty.all(const BorderSide(
                          color: constants.AppColors.textColor))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
