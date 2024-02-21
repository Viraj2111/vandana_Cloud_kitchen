import 'package:flutter/material.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/common_methos.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:vandana/Views/draweer_screen.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Cart"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: appMainColorLite,
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            //  itemCount: homeController.subCategoryDataModel.value
            //         .subcategoryList?.length ??
            //     0,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 30),
                height: Get.height * 0.1,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          backgroundImage: NetworkImage(homeController
                                  .subCategoryDataModel
                                  .value
                                  .subcategoryList?[index]
                                  .subcategoryImage ??
                              ""),
                        ),
                        width15,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              homeController
                                      .subCategoryDataModel
                                      .value
                                      .subcategoryList?[index]
                                      .subcategoryName ??
                                  "",
                              style: AppTextStyle.normalSemiBold18
                                  .copyWith(color: appMainColor),
                            ),
                            Text(
                              "Price  \u{20B9}80",
                              style: AppTextStyle.normalSemiBold13
                                  .copyWith(color: appMainColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            homeController.subCategoryDataModel.value
                                        .subcategoryList![index].count <=
                                    0
                                ? null
                                : homeController.subCategoryDataModel.value
                                    .subcategoryList![index].count--;
                            setState(() {});
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: appMainColor),
                            child: Icon(
                              Icons.remove,
                              color: primaryWhite,
                            ),
                          ),
                        ),
                        width05,
                        Text(
                          homeController.subCategoryDataModel.value
                                  .subcategoryList![index].count
                                  .toString() ??
                              "",
                          style: AppTextStyle.normalBold16
                              .copyWith(color: appMainColor),
                        ),
                        width05,
                        GestureDetector(
                          onTap: () {
                            homeController.subCategoryDataModel.value
                                .subcategoryList![index].count++;
                            setState(() {});
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: appMainColor),
                            child: Icon(
                              Icons.add,
                              color: primaryWhite,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 50,
            width: Get.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: appMainColor, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${homeController.subCategoryDataModel.value.subcategoryList!.first.count.toString()} Item |",
                      style: AppTextStyle.normalBold16
                          .copyWith(color: primaryWhite),
                    ),
                    Text(
                      "  \u{20B9} ${homeController.subCategoryDataModel.value.subcategoryList!.first.count * 80}",
                      style: AppTextStyle.normalBold16
                          .copyWith(color: primaryWhite),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    CommonMethod().getXSnackBar(
                        "Order Placed",
                        "Food Order has been placed Successfully...",
                        greenColor);
                    homeController.subCategoryDataModel.value.subcategoryList!
                        .first.count = 0;
                    setState(() {});
                    Get.offAll(() => MainDrawerScreen(),
                        duration: Duration(milliseconds: 450),
                        transition: Transition.rightToLeft);
                  },
                  child: Text(
                    "Place Order",
                    style:
                        AppTextStyle.normalBold16.copyWith(color: primaryWhite),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
