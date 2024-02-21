import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/controllers/home_controller.dart';
import 'package:vandana/Views/home_screens/billing_screen.dart';
import 'package:vandana/widget/dottedline_widget.dart';
import 'package:get/get.dart';

class TypeDetailScreen extends StatefulWidget {
  TypeDetailScreen(
      {super.key,
      required this.fromType,
      required this.subcategoryName,
      required this.categoryName});
  int fromType;
  String subcategoryName;
  String categoryName;
  @override
  State<TypeDetailScreen> createState() => _TypeDetailScreenState();
}

class _TypeDetailScreenState extends State<TypeDetailScreen> {
  HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getTiffinDetailBySubCategory(
        widget.categoryName, widget.subcategoryName);
        homeController.getSabjiList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF3EB),
      body: SafeArea(
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
          Obx(
            () => ListView.builder(
              padding: EdgeInsets.fromLTRB(20, 80, 20, 20),
              itemCount:
                  homeController.getItemListModel.value.productList?.length ??
                      0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => BillingScreen(
                      tiffinCount:  homeController.getItemListModel.value.productList?[index].tiffinCount ?? "",
                      weekendPrice: homeController.getItemListModel.value.productList?[index].satSundayPrice ?? "",
                      itemName: homeController.getItemListModel.value.productList?[index].productName,
                      getSabjiList: homeController.getSabjiDataModel.value.sabjiList,
                          fromType: widget.fromType,
                          mainImage: homeController.getItemListModel.value
                              .productList?[index].productImage1,
                          mrp: homeController
                              .getItemListModel.value.productList?[index].mrp,
                          Price: homeController
                              .getItemListModel.value.productList?[index].price,
                          itemDescription: homeController.getItemListModel.value
                              .productList?[index].description,
                        ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(homeController
                                          .getItemListModel
                                          .value
                                          .productList?[index]
                                          .productImage1 ??
                                      ""),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          width15,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeController.getItemListModel.value
                                        .productList?[index].productName ??
                                    "",
                                style: AppTextStyle.normalSemiBold22.copyWith(
                                    color: appMainColor,
                                    fontWeight: FontWeight.w400),
                              ),
                              height05,
                              SizedBox(
                                width: Get.width * 0.5,
                                child: Text(
                                  homeController.getItemListModel.value
                                          .productList?[index].description ??
                                      "",
                                  style: AppTextStyle.normalSemiBold18.copyWith(
                                      color: appMainColorLite,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      height20,
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: appMainColor)),
                            child: Text(
                              "Total Count: ${ homeController.getItemListModel.value
                                    .productList?[index].tiffinCount}",
                              style: AppTextStyle.normalSemiBold18.copyWith(
                                  color: appMainColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          customWidth(50),
                          Text(
                            homeController.getItemListModel.value
                                    .productList?[index].price ??
                                "",
                            style: AppTextStyle.normalSemiBold22
                                .copyWith(fontSize: 30, color: appMainColor),
                          ),
                        ],
                      ),
                      height10,
                      HorizontalDottedLine(),
                      height10,
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
 
  }
}
