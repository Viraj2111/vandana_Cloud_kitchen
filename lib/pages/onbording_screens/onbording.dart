import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vandana/app.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/buttons/text_button.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/pages/add_address_screen.dart';
import 'package:vandana/pages/auth_screens/login_screen.dart';
import 'package:vandana/pages/draweer_screen.dart';
import 'package:vandana/pages/home_screens/bottom_navigation.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/bg.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height20,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Enjoy Eating",
                  style: AppTextStyle.normalBold32
                      .copyWith(color: Color(0xffEC6223)),
                ),
              ),
              height10,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "All the delicious food on your phone",
                  style: AppTextStyle.normalBold20
                      .copyWith(color: Color(0xffEC6223)),
                ),
              ),
              height10,
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: PrimaryTextButton(
              title: "Get Start",
              onPressed: () {
                print("Checl data ==> ${dataStorages.read("home_Address") == "" ||
                    dataStorages.read("officeAddress") == " "}");
                if (dataStorages.read("user_name") == null ||
                    dataStorages.read("user_email")  == null||
                    dataStorages.read("user_mobile") == null) {
                  Get.offAll(() => LoginScreen());
                } else if (dataStorages.read("home_Address") == " " ||
                    dataStorages.read("officeAddress") == " ") {
                  Get.offAll(() => AddAddressScreen(fromAuth: true));
                } else {
                  Get.offAll(() => MainDrawerScreen(),
                      duration: Duration(milliseconds: 450),
                      transition: Transition.rightToLeft);
                }
              },
              buttonColor: Color(0xffF68D2D),
            ),
          )
        ],
      ),
    );
  }
}
