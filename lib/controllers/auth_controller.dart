import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vandana/Models/sign_up_model.dart';
import 'package:vandana/Services/http_services.dart';
import 'package:vandana/app.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/common_methos.dart';
import 'package:vandana/components/custom_loader.dart';
import 'package:vandana/pages/add_address_screen.dart';
import 'package:vandana/pages/draweer_screen.dart';

class AuthenticationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  setToLocal() {
    print("check login data ==> ${nameController.text}");
    print("check login data ==> ${emailController.text}");
    print("check login data ==> ${mobileController.text}");
    dataStorages.write("user_name", nameController.text);
    dataStorages.write("user_mobile", mobileController.text);
    dataStorages.write("user_email", emailController.text);
  }

  Rx<SignUpDataModel> signUpDataModel = SignUpDataModel().obs;
  Future sendOTPviaSignup() async {
    CustomLoader.openCustomLoader();
    Map<String, String> myPayload = {
      "phone": mobileController.text,
      "customer_name": nameController.text,
      "email": emailController.text
    };
    var response = await HttpServices.postHttpMethod(
      url: "https://softhubtechno.com/cloud_kitchen/api/send_otp.php",
      payload: myPayload,
    );
    log("Send OTP via signup module ::: ${response["status_code"] ?? 200}");

    // signUpDataModel.value = signUpDataModelFromJson(response["body"]);
    // log("Send OTP via signup module ::: ${signUpDataModel.value.statusCode}");
    await dataStorages.write("user_name", nameController.text);
    await dataStorages.write("user_email", emailController.text);
    await dataStorages.write("user_mobile", mobileController.text);
    CustomLoader.closeCustomLoader();

    try {
      CommonMethod()
          .getXSnackBar("OTP", "Otp has been sened successfully", greenColor);
      CustomLoader.closeCustomLoader();
      Get.offAll(() => AddAddressScreen(fromAuth: true));

      // Your Statement
    } catch (e, st) {
      CustomLoader.closeCustomLoader();
      CommonMethod().getXSnackBar("OTP", response["body"]["message"], red);
      // CustomLoader.closeCustomLoader();
      log("Something went wrong during getting category list ::: $e");
      log("Error location during getting category list ::: $st");
    }
  }

  Future LoginAPI() async {
    CustomLoader.openCustomLoader();
    Map<String, String> myPayload = {
      "phone": mobileController.text,
    };
    var response = await HttpServices.postHttpMethod(
      url: "https://softhubtechno.com/cloud_kitchen/api/login.php",
      payload: myPayload,
    );
    log("Send OTP via signup module ::: ${response}");

    CustomLoader.closeCustomLoader();

    try {
      CommonMethod().getXSnackBar("OTP", "Login SuccessFully", greenColor);
      CustomLoader.closeCustomLoader();
      Get.offAll(() => MainDrawerScreen());

      // Your Statement
    } catch (e, st) {
      CustomLoader.closeCustomLoader();
      CommonMethod().getXSnackBar("OTP", response["body"]["message"], red);
      // CustomLoader.closeCustomLoader();
      log("Something went wrong during getting category list ::: $e");
      log("Error location during getting category list ::: $st");
    }
  }
  // Future verifyOTP() async {
  //   CustomLoader.openCustomLoader();
  //   Map<String, String> myPayload = {
  //     "phone": mobileController.text,
  //     "customer_name": nameController.text,
  //     "email": emailController.text
  //   };
  //   var response = await HttpServices.postHttpMethod(
  //     url: "https://softhubtechno.com/cloud_kitchen/api/send_otp.php",
  //     payload: myPayload,
  //   );
  //   log("Send OTP via signup module ::: ${response["status_code"] ?? 200}");

  //   // signUpDataModel.value = signUpDataModelFromJson(response["body"]);
  //   // log("Send OTP via signup module ::: ${signUpDataModel.value.statusCode}");
  //       CustomLoader.closeCustomLoader();

  //   try {
  //          CommonMethod()
  //           .getXSnackBar("OTP", "Otp has been sened successfully", greenColor);
  //       CustomLoader.closeCustomLoader();
  //       Get.offAll(()=> AddAddressScreen(fromAuth: true));

  //       // Your Statement

  //   } catch (e, st) {
  //       CustomLoader.closeCustomLoader();
  //       CommonMethod().getXSnackBar("OTP", response["body"]["message"], red);
  //     // CustomLoader.closeCustomLoader();
  //     log("Something went wrong during getting category list ::: $e");
  //     log("Error location during getting category list ::: $st");
  //   }
  // }
}
