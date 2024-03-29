import 'package:flutter/material.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/buttons/text_button.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/controllers/auth_controller.dart';
import 'package:vandana/Views/auth_screens/signup_screen.dart';
import 'package:vandana/widget/text_widgets/input_text_field_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      body: GetBuilder<AuthenticationController>(
          init: AuthenticationController(),
          builder: (controller) {
            return Stack(
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
                        style: AppTextStyle.normalBold24
                            .copyWith(color: primaryWhite),
                      ),
                      height20,
                      textFormField(
                        controller: controller.mobileController,
                        filledColor: primaryWhite.withOpacity(0.8),
                        borderRaduis: 10,
                        cursorColor: primaryBlack,
                        hintText: "Mobile",
                        hintStyle: AppTextStyle.normalBold14
                            .copyWith(color: primaryBlack.withOpacity(.5)),
                      ),
                      customHeight(20),
                      PrimaryTextButton(
                        title: "Log In",
                        titleColor: primaryBlack,
                        onPressed: () async {
                          await controller.postLogin();
                        },
                        width: Get.width,
                        buttonColor: primaryWhite,
                      ),
                      height10,
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SignupScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have any account? ",
                              style: AppTextStyle.normalRegular14
                                  .copyWith(color: primaryWhite),
                            ),
                            Text(
                              "Sign Up",
                              style: AppTextStyle.normalBold14,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
