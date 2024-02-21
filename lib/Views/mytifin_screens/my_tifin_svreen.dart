import 'package:flutter/material.dart';
import 'package:vandana/Services/storage_services.dart';
import 'package:vandana/app.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:get/get.dart';
import 'package:vandana/Views/mytifin_screens/cancle_tifin_screen.dart';
import 'package:vandana/Views/mytifin_screens/select_vegetable_screen.dart';
import 'package:vandana/components/storage_key_constant.dart';
import 'package:vandana/widget/dottedline_widget.dart';

class MyTifinScreen extends StatelessWidget {
  const MyTifinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFEF3EB),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  right: 0,
                  top: Get.height * -0.2,
                  left: Get.width * 0.38,
                  bottom: 200,
                  child: Image.asset("assets/images/rightShape.png",
                      opacity: AlwaysStoppedAnimation(.5))),
              Image.asset("assets/images/upbg.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  height20,
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 35, top: 10, bottom: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Hi, ${StorageServices.getData(dataType: StorageKeyConstant.stringType, prefKey: StorageKeyConstant.userName) ?? ""}",
                          style: AppTextStyle.normalBold32
                              .copyWith(color: primaryWhite),
                        ),
                      ],
                    ),
                  ),
                  customHeight(Get.height * 0.2),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 10, bottom: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(
                            "assets/images/Artboard 2 copy 3icons_imgs.png",
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Main Course Menu",
                              style: AppTextStyle.normalSemiBold22.copyWith(
                                  color: appMainColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            height05,
                            Text(
                              "2 Chapati, 2 sabji, \n1 plate Rise, Dal, Salad\n sweets, butter milk",
                              style: AppTextStyle.normalSemiBold18.copyWith(
                                  color: appMainColorLite,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  height20,
                  height20,
                  height20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: appMainColor)),
                        child: Text(
                          "Total Count",
                          style: AppTextStyle.normalSemiBold18.copyWith(
                              color: appMainColor, fontWeight: FontWeight.w400),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SelectVegetableScreen());
                        },
                        child: Container(
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
                            "Select Vegetable",
                            style: AppTextStyle.normalRegular17.copyWith(
                                color: appMainColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: HorizontalDottedLine(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => CancleTiffinScreen());
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 30),
                      alignment: Alignment.center,
                      height: 40,
                      width: Get.width * 0.3,
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
                        "Cancle Tiffin",
                        style: AppTextStyle.normalRegular17.copyWith(
                            color: appMainColor, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset("assets/images/bottomCurve.png")),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/Artboard 3icons.png",
                    height: 150,
                    width: 150,
                  )),
            ],
          ),
        ));
  }
}
