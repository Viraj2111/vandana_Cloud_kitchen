import 'package:flutter/material.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/buttons/text_button.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:vandana/Views/home_screens/item_detail_screen.dart';
import 'package:vandana/Views/home_screens/screens/cart_screen.dart';
import 'package:vandana/Views/home_screens/screens/food_category.dart';
import 'package:vandana/widget/type_selection_widget.dart';

class TifinTypeScreen extends StatefulWidget {
  TifinTypeScreen(
      {super.key, required this.categoryName, required this.fromTiffin});
  String categoryName;
  bool fromTiffin;
  @override
  State<TifinTypeScreen> createState() => _TifinTypeScreenState();
}

class _TifinTypeScreenState extends State<TifinTypeScreen> {
  HomeController homeController = Get.find<HomeController>();

  List data = [
    "We provide daily choice of vegetables out of 20 sabjis",
    "Different menu for lunch and dinner",
    "Yoe can rechoice or change your vegetable/curry (Before 12 hours of the day)",
    "Free Cancelation with carry forward your tiffin (Before 12 hours of the day)",
    "Tiffin provide in dispossible meal tray for hygine purpose"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getSubCategory(widget.categoryName).whenComplete((){
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      appBar: widget.fromTiffin == false
          ? AppBar(
              title: Text(
                "Food",
                style: AppTextStyle.normalBold16.copyWith(color: appMainColor),
              ),
              backgroundColor: primaryWhite,
              automaticallyImplyLeading: true,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios, color: appMainColor,)),
              centerTitle: true,
            )
          : null,                                              
      body: Stack(
        children: [
          Positioned(
              right: 0,
              top: 100,
              bottom: 300,
              child: Image.asset(
                "assets/images/rightShape.png",
              )),
          Positioned(
              left: 0,
              top: Get.height * 0.7,
              bottom: Get.height * 0.1,
              child: Image.asset(
                "assets/images/leftShape.png",
              )),
          widget.fromTiffin == false
              ?  ListView.builder(
                     itemCount: homeController.subCategoryDataModel.value
                            .subcategoryList?.length ??
                        0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => FoodDetailListScreen(
                            
                                    fromType: 0,
                                    categoryName: homeController
                                            .subCategoryDataModel
                                            .value
                                            .subcategoryList?[index]
                                            .categoryName ??
                                        "",
                                    subcategoryName: homeController
                                            .subCategoryDataModel
                                            .value
                                            .subcategoryList?[index]
                                            .subcategoryName ??
                                        "",
                                  ));
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                  Text(
                                    homeController
                                            .subCategoryDataModel
                                            .value
                                            .subcategoryList?[index]
                                            .subcategoryName ??
                                        "",
                                    style: AppTextStyle.normalSemiBold18
                                        .copyWith(color: appMainColor),
                                  )
                                ],
                              ),
                             
                           
                           
                            ],
                          ),
                        ),
                      );
                    },
                  )
                
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        customHeight(50),
                        GestureDetector(
                            onTap: () {
                              homeController.onMonth();
                              Get.to(() => TypeDetailScreen(
                                    fromType: 0,
                                    categoryName: homeController
                                            .subCategoryDataModel
                                            .value
                                            .subcategoryList?[0]
                                            .categoryName ??
                                        "",
                                    subcategoryName: homeController
                                            .subCategoryDataModel
                                            .value
                                            .subcategoryList?[0]
                                            .subcategoryName ??
                                        "",
                                  ));
                            },
                            child: Obx(() => TypeSelectionWidgteScreen(
                                tabName: homeController
                                        .subCategoryDataModel
                                        .value
                                        .subcategoryList?[0]
                                        .subcategoryName ??
                                    "",
                                isTrue: homeController.monthly.value,
                                imageIcon: "assets/images/monthly.png"))),
                        GestureDetector(
                            onTap: () {
                              homeController.onWeek();
                              Get.to(() => TypeDetailScreen(
                                    fromType: 1,
                                    categoryName: homeController
                                            .subCategoryDataModel
                                            .value
                                            .subcategoryList?[1]
                                            .categoryName ??
                                        "",
                                    subcategoryName: homeController
                                            .subCategoryDataModel
                                            .value
                                            .subcategoryList?[1]
                                            .subcategoryName ??
                                        "",
                                  ));
                            },
                            child: Obx(() => TypeSelectionWidgteScreen(
                                tabName: homeController
                                        .subCategoryDataModel
                                        .value
                                        .subcategoryList?[1]
                                        .subcategoryName ??
                                    "",
                                isTrue: homeController.weekly.value,
                                imageIcon: "assets/images/weekly.png"))),
                        Obx(
                          () => homeController.subCategoryDataModel.value
                                          .subcategoryList ==
                                      null ||
                                  homeController.subCategoryDataModel.value
                                          .subcategoryList!.length <=
                                      2
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () {
                                    Get.to(() => TypeDetailScreen(
                                          fromType: 2,
                                          categoryName: homeController
                                                  .subCategoryDataModel
                                                  .value
                                                  .subcategoryList?[2]
                                                  .categoryName ??
                                              "",
                                          subcategoryName: homeController
                                                  .subCategoryDataModel
                                                  .value
                                                  .subcategoryList?[2]
                                                  .subcategoryName ??
                                              "",
                                        ));

                                    homeController.onday();
                                  },
                                  child: Obx(() => TypeSelectionWidgteScreen(
                                      tabName: homeController
                                              .subCategoryDataModel
                                              .value
                                              .subcategoryList?[2]
                                              .subcategoryName ??
                                          "",
                                      isTrue: homeController.daily.value,
                                      imageIcon: "assets/images/daily.png"))),
                        ),
                      ],
                    ),
                    ...List.generate(
                        data.length, (index) => TypeText(data: data[index])),
                    Image.asset("assets/images/bottomCurve.png"),
                  ],
                ),
          widget.fromTiffin == false
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: homeController.subCategoryDataModel.value
                              .subcategoryList?.first.count   ==
                          0 ||  homeController.subCategoryDataModel.value
                              .subcategoryList?.first.count == null
                      ? SizedBox()
                      : Container(
                          margin: EdgeInsets.all(20),
                          height: 50,
                          width: Get.width,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: primaryWhite,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${homeController.subCategoryDataModel.value.subcategoryList!.first.count.toString()} Item |",
                                    style: AppTextStyle.normalBold16
                                        .copyWith(color: appMainColor),
                                  ),
                                  Text(
                                    "  \u{20B9} ${homeController.subCategoryDataModel.value.subcategoryList!.first.count * 80}",
                                    style: AppTextStyle.normalBold16
                                        .copyWith(color: appMainColor),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(()=> CartScreen());
                                },
                                child: Text(
                                  "View Cart",
                                  style: AppTextStyle.normalBold16
                                      .copyWith(color: appMainColor),
                                ),
                              )
                            ],
                          ),
                        ),
                )
              : Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/tifintypeeVector.png",
                    height: 220,
                    width: 220,
                  )),
        ],
      ),
    );
  }
}
