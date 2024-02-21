import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vandana/Models/get_otp_model.dart';
import 'package:vandana/Models/post_login_model.dart';
import 'package:vandana/Services/http_services.dart';
import 'package:vandana/Services/storage_services.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/common_methos.dart';
import 'package:vandana/components/custom_loader.dart';
import 'package:vandana/Views/add_address_screen.dart';
import 'package:vandana/Views/draweer_screen.dart';
import 'package:vandana/components/storage_key_constant.dart';

class AuthenticationController extends GetxController {
  GetOtpModel getOtpModel = GetOtpModel();
  PostLoginModel postLoginModel = PostLoginModel();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  Future getOtp() async {
    try {
      CustomLoader.openCustomLoader();
      Map<String, String> payload = {
        "phone": mobileController.text,
        "customer_name": nameController.text,
        "email": emailController.text
      };

      log("Get otp payload :::  $payload");

      var response = await HttpServices.postHttpMethod(
        url: "https://softhubtechno.com/cloud_kitchen/api/send_otp.php",
        payload: payload,
      );

      log("Get otp response ::: $response");

      getOtpModel = getOtpModelFromJson(response["body"]);

      if (getOtpModel.statusCode == "200" || getOtpModel.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.userMobile,
            stringData: mobileController.text);
        StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.userMobile,
            stringData: mobileController.text);
        StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.userMobile,
            stringData: mobileController.text);
        Get.offAll(() => AddAddressScreen(fromAuth: true));
      } else {
        CustomLoader.closeCustomLoader();

        CommonMethod().getXSnackBar("OTP", "${getOtpModel.message}", red);
      }
    } catch (error) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting otp ::: ${error}");
    }
  }

  Future postLogin() async {
    try {
      CustomLoader.openCustomLoader();
      Map<String, String> payload = {"phone": mobileController.text};

      log("Post login payload :::  $payload");

      var response = await HttpServices.postHttpMethod(
        url: "https://softhubtechno.com/cloud_kitchen/api/login.php",
        payload: payload,
      );

      log("Post otp response ::: $response");

      postLoginModel = postLoginModelFromJson(response["body"]);

      if (postLoginModel.statusCode == "200" ||
          postLoginModel.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        StorageServices.setData(
            dataType: StorageKeyConstant.boolType,
            prefKey: StorageKeyConstant.isAuthenticate,
            boolData: true);
        StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.userMobile,
            stringData: "${postLoginModel.result?.phone}");
        StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.userType,
            stringData: "${postLoginModel.result?.userType}");
        StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.userCode,
            stringData: "${postLoginModel.result?.customerCode}");
        StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.userName,
            stringData: "${postLoginModel.result?.customerName}");
        StorageServices.setData(
            dataType: StorageKeyConstant.stringType,
            prefKey: StorageKeyConstant.userEmail,
            stringData: "${postLoginModel.result?.email}");
        CommonMethod().getXSnackBar("OTP", "Login SuccessFully", greenColor);
        Get.offAll(() => MainDrawerScreen());
      } else {
        CustomLoader.closeCustomLoader();

        CommonMethod().getXSnackBar("OTP", "${postLoginModel.message}", red);
      }
    } catch (error) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during posting login ::: ${error}");
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
