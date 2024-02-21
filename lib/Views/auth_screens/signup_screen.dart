import 'package:flutter/material.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/buttons/text_button.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/common_methos.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:get/get.dart';
import 'package:vandana/Views/auth_screens/login_screen.dart';
import 'package:vandana/widget/text_widgets/input_text_field_widget.dart';
import 'package:vandana/controllers/auth_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      body: Stack(
        children: [
          Positioned(
              right: 0,
              top: 100,
              bottom: 300,
              child: Image.asset(
                "assets/images/rightShape.png",
              )),
          Positioned(
              left: 0,
              top: Get.height * 0.7,
              bottom: Get.height * 0.1,
              child: Image.asset(
                "assets/images/leftShape.png",
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please Signup",
                  style:
                      AppTextStyle.normalBold24.copyWith(color: primaryWhite),
                ),
                height20,
                textFormField(
                  controller: authenticationController.nameController,
                  filledColor: primaryWhite.withOpacity(0.8),
                  borderRaduis: 10,
                  cursorColor: primaryBlack,
                  hintText: "Name",
                  hintStyle: AppTextStyle.normalBold14
                      .copyWith(color: primaryBlack.withOpacity(.5)),
                ),
                height20,
                textFormField(
                  controller: authenticationController.mobileController,
                  filledColor: primaryWhite.withOpacity(0.8),
                  borderRaduis: 10,
                  cursorColor: primaryBlack,
                  hintText: "Mobile Number",
                  hintStyle: AppTextStyle.normalBold14
                      .copyWith(color: primaryBlack.withOpacity(.5)),
                  maxLength: 10,
                ),
                textFormField(
                  controller: authenticationController.emailController,
                  filledColor: primaryWhite.withOpacity(0.8),
                  borderRaduis: 10,
                  cursorColor: primaryBlack,
                  hintText: "Email Address",
                  hintStyle: AppTextStyle.normalBold14
                      .copyWith(color: primaryBlack.withOpacity(.5)),
                ),
                customHeight(20),
                PrimaryTextButton(
                  title: "Send Otp",
                  titleColor: primaryBlack,
                  onPressed: () async {
                    if (authenticationController.nameController.text == "" ||
                        authenticationController.emailController.text == "" ||
                        authenticationController.mobileController.text == "") {
                      CommonMethod().getXSnackBar(
                          "Error", "Please Endter Valide Data", red);
                    } else {
                      await authenticationController.getOtp();
                    }
                  },
                  width: Get.width,
                  buttonColor: primaryWhite,
                ),
                height10,
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignInScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Alredy have an account? ",
                        style: AppTextStyle.normalRegular14
                            .copyWith(color: primaryWhite),
                      ),
                      Text(
                        "Log In",
                        style: AppTextStyle.normalBold14,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
