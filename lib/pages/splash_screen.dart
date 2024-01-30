import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vandana/all_apis_call.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/pages/onbording_screens/onbording.dart';
import 'package:vandana/utils/repository/common_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

String uid = dataStorages.read('userid');

class _SplashScreenState extends State<SplashScreen> {
  static final dataStorage = GetStorage();
  AllApisCall allApisCall = AllApisCall();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getLocation();
      startTime();
    });
  }

  startTime() async {
    return Timer(
      const Duration(milliseconds: 1500),
      () {
        Get.offAll(() => OnBordingScreen(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 400));
      },
    );
  }

  void navigationPage() async {
    if (dataStorages.read("user_name") == null ||
        dataStorages.read("user_email") ||
        dataStorages.read("user_mobile")) {}
  }

  getLocation() async {
    // NetworkDioHttp.setDynamicHeader(endPoint: ApiAppConstants.apiEndPoint);
    if (dataStorage.read('latitude') == null &&
        dataStorage.read('longitude') == null) {
      final Position position = await CommonRepository.getCurrentLocation();
 await getAddress(
         position.latitude, position.latitude);
      await dataStorage.write('latitude', position.latitude);
      await dataStorage.write('longitude', position.longitude);
      
    }
    debugPrint(
        '\x1b[97m Lat-Lng = ${dataStorage.read('latitude')}-${dataStorage.read('longitude')}');
   
  }
Future<String> getAddress(double latitude, double longitude) async {
  try {
    log("check picked address==>1");
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    log("check picked address==> ${placemarks.length}");
    
    String address = "${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}";
    return address;
  } catch (e) {
    return "Unable to get address";
  }
}
  @override
  Widget build(BuildContext context) {
    return Container(
      color: redColor,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xffFEF3EB),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child:
              Center(child: Image.asset("assets/images/vandana_app_logo.png")),
        ),
      ),
    );
  }
}
