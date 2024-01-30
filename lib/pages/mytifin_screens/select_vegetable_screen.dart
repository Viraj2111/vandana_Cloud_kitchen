import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/widget/dottedline_widget.dart';

class SelectVegetableScreen extends StatelessWidget {
  SelectVegetableScreen({super.key});

  RxList vegeTableList = [
    "Palak Paneer",
    "Palak Paneer Matar",
    "Paneer Methi Palak",
    "Matar Ki Sabzi",
    "Dry Aloo Matar",
    "Malay Kofta"
  ].obs;

  RxInt selectedSabji = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/upbg.png",
              height: 100,
            ),
            Container(
              child: Positioned(
                  right: -50,
                  top: Get.height * 0.75,
                  child: Transform.rotate(
                      angle: 90 * pi / 180,
                      child: Image.asset(
                        "assets/images/rotet.png",
                        height: 100,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customHeight(Get.height * 0.1),
                  Text(
                    "Select vegetable",
                    style: AppTextStyle.normalBold32.copyWith(fontSize: 40),
                  ),
                  Container(
                    width: Get.width,
                    child: Text(
                      "Today's Vegetable Offered",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.normalBold32.copyWith(fontSize: 32),
                    ),
                  ),
                  height20,
                  height20,
                  ...List.generate(
                      vegeTableList.length,
                      (index) => Padding(
                            padding:
                                const EdgeInsets.only(left: 50, bottom: 20),
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  selectedSabji.value = index;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: selectedSabji == index
                                                  ? primaryWhite
                                                  : appMainColorLite),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: selectedSabji == index
                                                ? primaryWhite
                                                : appMainColorLite,
                                          ),
                                        ),
                                      ),
                                      width15,
                                      Text(
                                        vegeTableList[index],
                                        style: AppTextStyle.normalBold16
                                            .copyWith(fontSize: 22),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
              
                  customHeight(40),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: Get.width * 0.5,
                    decoration: BoxDecoration(
                      color: primaryWhite,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      "Select & Process",
                      style: AppTextStyle.normalRegular17.copyWith(
                          color: appMainColor, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
    Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset("assets/images/bottomCurve.png")),
              Positioned(
                  bottom: 0,
                  left: Get.width * 0.3,
                  right: 0,
                  child: Image.asset("assets/images/Artboard 3 copyicons.png",height: 150,width: 150,)),
          ],
        ),
      ),

    );
  }
}
