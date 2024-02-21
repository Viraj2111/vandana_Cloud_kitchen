import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../components/colors.dart';
import '../../components/common_methos.dart';
import '../app_constants.dart';
import '../network_dio/network_dio.dart';

NetworkRepository networkRepository = NetworkRepository();

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();

  factory NetworkRepository() {
    return _networkRepository; 
  }
  NetworkRepository._internal();

  FocusNode searchFocus = FocusNode();

  Dio dio = Dio();
  getCategoryData(context) async {
    try {
      final categoryResponse = await dio
          .get("https://softhubtechno.com/cloud_kitchen/api/category_list.php");
      print("get Category response ::: $categoryResponse");
      return categoryResponse;
    } catch (e, f) {
      print("ERROR LOG ==> $e, NEW ERROR ==> $f");
      CommonMethod().getXSnackBar("Error", e.toString(), red);
    }
  }

  Future<void> checkResponse(
    response,
    modelResponse,
  ) async {
    log("response check------>${response}---->Checked");
    if ((response['body']['status'] == 401 ||
            response['body']['status'] == 410) &&
        dataStorage.read("token") != null) {}
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        return modelResponse;
        // } else {
        //   showErrorDialog(message: response['body']['message']);
        // }
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        return modelResponse;
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    }
    // else {
    //   if (response['body']['status'] == 401 ||
    //       response['body']['status'] == '401') {
    //     showErrorDialog(message: response['body']['message']);
    //     Future.delayed(Duration(seconds: 2), () {
    //       // Get.to(LoginScreen());
    //     });
    // }
    else {
      if (dataStorage.read("token") != null) {
        showErrorDialog(message: response['body']['message']);
      }
    }
    // }
  }

  Future<void> checkResponse2(
    response,
  ) async {
    log("response check------>2${response['body']['message']}---->Checked");
    if ((response['body']['status'] == 401 ||
            response['body']['status'] == 410) &&
        dataStorage.read("token") != null) {}
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        log('${response['body']}');
        return response['body'];
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        showErrorDialog(message: response['body']['message']);
        return response['body'];
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    } else {
      if (dataStorage.read("token") != null) {
        showErrorDialog(message: response['error_description']);
      }
    }
  }

  void showErrorDialog({required String message}) {
    CommonMethod().getXSnackBar("Error", message.toString(), red);
  }
}
