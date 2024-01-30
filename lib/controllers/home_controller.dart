import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:vandana/Models/getStoreListData_model.dart';
import 'package:vandana/Models/get_category_list_model.dart';
import 'package:vandana/Models/get_item_list_model.dart';
import 'package:vandana/Models/get_sabji_list_model.dart';
import 'package:vandana/app.dart';
import 'package:vandana/components/custom_loader.dart';
import 'package:vandana/utils/endpoint_constant.dart';

import '../Models/get_sub_category_data_model.dart';
import '../Services/http_services.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  final drawerController = ZoomDrawerController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    
  }

  final RxInt selectedIndex = 0.obs;

  RxBool monthly = true.obs;
  RxBool weekly = false.obs;
  RxBool daily = false.obs;

  onMonth() {
    monthly.value = true;
    weekly.value = false;
    daily.value = false;
  }

  onWeek() {
    monthly.value = false;
    weekly.value = true;
    daily.value = false;
  }

  onday() {
    monthly.value = false;
    weekly.value = false;
    daily.value = true;
  }

  Rx<GetCategoryListModel> getCategoryListModel = GetCategoryListModel().obs;

  Future getCategoryList() async {
    CustomLoader.openCustomLoader();

    var response =
        await HttpServices.getHttpMethod(url: EndPointConstant.categoryList);

    log("Get category response ::: $response");

    getCategoryListModel.value = getCategoryListModelFromJson(response['body']);

    try {
      if (getCategoryListModel.value.statusCode == "200" ||
          getCategoryListModel.value.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        // Your Statement
      } else {
        CustomLoader.closeCustomLoader();
        log("Something went wrong during getting category list ::: ${getCategoryListModel.value.message}");
        // Your Message
      }
    } catch (e, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting category list ::: $e");
      log("Error location during getting category list ::: $st");
    }
    CustomLoader.closeCustomLoader();
  }

  Rx<GetStoreListDataModel> getStoreListData = GetStoreListDataModel().obs;

  RxDouble calculatedDistance = 0.0.obs;
  RxDouble km = 0.0.obs;
  Future<void> calculateDistance(
      startLatitude, startLongitude, endLatitude, endLongitude) async {
    calculatedDistance.value = await Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
    km.value = calculatedDistance.value / 1000.0;
    print('Distance: ${km.value} KM');
  }

List ditanceList = [];

  Future getStoreDetails() async {
    CustomLoader.openCustomLoader();

    var response = await HttpServices.getHttpMethod(
        url: "https://softhubtechno.com/cloud_kitchen/api/branch_list.php");

    log("Get Store response ::: $response");

    getStoreListData.value = getStoreListDataModelFromJson(response['body']);

    try {
      if (getStoreListData.value.statusCode == "200" ||
          getStoreListData.value.statusCode == "201") {
 for (var i = 0; i <  getStoreListData.value.branchList!.length; i++) {
          List<String> latLongList = getStoreListData.value.branchList![i].latLong!.split(', ');

       await calculateDistance(
              dataStorages.read('latitude'),
              dataStorages.read('longitude'),
              double.parse(latLongList[0]),
              double.parse(latLongList[1]));
              ditanceList.add(km.value <= 10? true:false);
             
 }
print("Chek data ==> ${ditanceList}");
        CustomLoader.closeCustomLoader();
        // getStoreListData.value.branchList!.forEach((e) async{
        //   List<String> latLongList = e.latLong!.split(', ');
        //  await calculateDistance(
        //       dataStorages.read('latitude'),
        //       dataStorages.read('longitude'),
        //       double.parse(latLongList[0]),
        //       double.parse(latLongList[1]));
        //       print("demo check ==> ${km.value}");
        //       if(km.value <= 20000){
        //         e.isAvailable = true;
        //       }
        // });
        
        //       print("demo check ==> ${km.value <= 1000}");

        getStoreListData.refresh();
print("Distance LIst ==> ${ditanceList}");
        // Your Statement
      } else {
        CustomLoader.closeCustomLoader();
        log("Something went wrong during getting category list ::: ${getStoreListData.value.message}");
        // Your Message
      }
    } catch (e, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting category list ::: $e");
      log("Error location during getting category list ::: $st");
    }
    CustomLoader.closeCustomLoader();
  }

  Rx<SubCategoryDataModel> subCategoryDataModel = SubCategoryDataModel().obs;

  Future getSubCategory(String? categoryName) async {
    print("pasing Name ==> ${categoryName}");
    CustomLoader.openCustomLoader();
    Map<String, String> myPayload = {
      "category_name": categoryName.toString(),
    };
    var response = await HttpServices.postHttpMethod(
        url: "https://softhubtechno.com/cloud_kitchen/api/subcategory_list.php",
        payload: myPayload);

    log("Get category response ::: $response");

    subCategoryDataModel.value = subCategoryDataModelFromJson(response['body']);

    try {
      if (subCategoryDataModel.value.statusCode == "200" ||
          subCategoryDataModel.value.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        // Your Statement
      } else {
        CustomLoader.closeCustomLoader();
        log("Something went wrong during getting category list ::: ${getCategoryListModel.value.message}");
        // Your Message
      }
    } catch (e, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting category list ::: $e");
      log("Error location during getting category list ::: $st");
    }
  }

  Rx<GetItemListModel> getItemListModel = GetItemListModel().obs;

  Future getTiffinDetailBySubCategory(
      String? categoryName, String? subCategoryName) async {
    print("pasing Name ==> ${categoryName}");
    CustomLoader.openCustomLoader();
    Map<String, String> myPayload = {
      "category_name": categoryName.toString(),
      "subcategory_name": subCategoryName.toString()
    };
    var response = await HttpServices.postHttpMethod(
        url: "https://softhubtechno.com/cloud_kitchen/api/item_list.php",
        payload: myPayload);

    log("Get category response ::: $response");

    getItemListModel.value = getItemListModelFromJson(response['body']);

    try {
      if (getItemListModel.value.statusCode == "200" ||
          getItemListModel.value.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        // Your Statement
      } else {
        CustomLoader.closeCustomLoader();
        log("Something went wrong during getting category list ::: ${getItemListModel.value.message}");
        // Your Message
      }
    } catch (e, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting category list ::: $e");
      log("Error location during getting category list ::: $st");
    }
  }

  Rx<GetSabjiDataModel> getSabjiDataModel = GetSabjiDataModel().obs;

  Future getSabjiList() async {
    CustomLoader.openCustomLoader();

    var response = await HttpServices.getHttpMethod(
      url: "https://softhubtechno.com/cloud_kitchen/api/sabji_list.php",
    );

    log("Get sABJI response ::: $response");

    getSabjiDataModel.value = getSabjiDataModelFromJson(response['body']);

    try {
      if (getSabjiDataModel.value.statusCode == "200" ||
          getSabjiDataModel.value.statusCode == "201") {
        CustomLoader.closeCustomLoader();
        // Your Statement
      } else {
        CustomLoader.closeCustomLoader();
        log("Something went wrong during getting category list ::: ${getSabjiDataModel.value.message}");
        // Your Message
      }
    } catch (e, st) {
      CustomLoader.closeCustomLoader();
      log("Something went wrong during getting category list ::: $e");
      log("Error location during getting category list ::: $st");
    }
  }
}
