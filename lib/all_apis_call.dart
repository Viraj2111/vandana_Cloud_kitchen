import 'dart:developer';
import 'package:vandana/Models/get_category_list_model.dart';
import 'package:vandana/Models/get_item_list_model.dart';
import 'package:vandana/Models/get_packaging_list_model.dart';
import 'package:vandana/Models/get_sabji_list_model.dart';
import 'package:vandana/Models/get_time_slot_model.dart';
import 'package:vandana/Services/http_services.dart';
import 'package:vandana/components/custom_loader.dart';
import 'package:vandana/utils/endpoint_constant.dart';

class AllApisCall {
  // Get Category Api


  // Get Item List Api
  GetItemListModel getItemListModel = GetItemListModel();

  Future getItemList() async {
    CustomLoader.openCustomLoader();

    Map<String, String> payload = {
      "category_name": "Tiffin",
      "subcategory_name": "Monthly",
    };

    var response = await HttpServices.postHttpMethod(
        url: EndPointConstant.itemList, payload: payload);

    log("Get item list response ::: $response");

    getItemListModel = getItemListModelFromJson(response['body']);

    try {
      if (getItemListModel.statusCode == "200" ||
          getItemListModel.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        // Your Statement
      } else {
        CustomLoader.closeCustomLoader();
        log("Something went wrong during getting item list ::: ${getItemListModel.message}");
        // Your Message
      }
    } catch (e, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting item list ::: $e");
      log("Error location during getting item list ::: $st");
    }
  }

  // Get Time Slot Api

  GetTimeSlotModel getTimeSlotModel = GetTimeSlotModel();

  Future getTimeSlotList() async {
    CustomLoader.openCustomLoader();

    Map<String, String> payload = {"tiffin_type": "lunch"};

    var response = await HttpServices.postHttpMethod(
        url: EndPointConstant.itemList, payload: payload);

    log("Get time slot list response ::: $response");

    getTimeSlotModel = getTimeSlotModelFromJson(response['body']);

    try {
      if (getTimeSlotModel.statusCode == "200" ||
          getTimeSlotModel.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        // Your Statement
      } else {
        CustomLoader.closeCustomLoader();
        log("Something went wrong during getting time slot list ::: ${getTimeSlotModel.message}");
        // Your Message
      }
    } catch (e, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting time slot list ::: $e");
      log("Error location during getting time slot list ::: $st");
    }
  }



  // Get Packaging List Api

  
}
