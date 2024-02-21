import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vandana/Services/storage_services.dart';
import 'package:vandana/Views/home_screens/bottom_navigation.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/buttons/text_button.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/Views/add_address_screen.dart';
import 'package:vandana/Views/auth_screens/signup_screen.dart';
import 'package:vandana/Views/draweer_screen.dart';
import 'package:vandana/components/storage_key_constant.dart';

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
              onPressed: () async {
                bool isAuthenticate = await StorageServices.getData(
                        dataType: StorageKeyConstant.boolType,
                        prefKey: StorageKeyConstant.isAuthenticate) ??
                    false;
                if (isAuthenticate) {
                  if (StorageServices.getData(
                              dataType: StorageKeyConstant.stringType,
                              prefKey: StorageKeyConstant.homeAddress) !=
                          null ||
                      StorageServices.getData(
                              dataType: StorageKeyConstant.stringType,
                              prefKey: StorageKeyConstant.officeAddress) !=
                          null) {
                    Get.offAll(() => BottomNavigationScreen());
                  } else {
                    Get.offAll(() => AddAddressScreen(fromAuth: true));
                  }
                } else {
                  Get.offAll(() => SignupScreen());
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
