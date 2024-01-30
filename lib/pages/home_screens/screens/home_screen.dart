import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vandana/Models/getStoreListData_model.dart';
import 'package:vandana/app.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:get/get.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/controllers/home_controller.dart';
import 'package:vandana/pages/home_screens/tifin_type.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find<HomeController>();
  String? selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getCategoryList();
    homeController.getStoreDetails().whenComplete(() {
      setState(() {});
    });
  }

  int? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFEF3EB),
        body: SafeArea(
          child: Stack(
            children: [
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
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  ZoomDrawer.of(context)!.open();
                                },
                                child: Icon(Icons.menu,
                                    color: primaryWhite, size: 40)),
                            Text(
                              " Hi, ${dataStorages.read("user_name") ?? ""}",
                              style: AppTextStyle.normalBold32
                                  .copyWith(color: primaryWhite),
                            ),
                          ],
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Icon(
                                  Icons.list,
                                  size: 16,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: List.generate(
                                homeController.getStoreListData.value.branchList
                                        ?.length ??
                                    0,
                                (index) => DropdownMenuItem(
                                      value: homeController.getStoreListData
                                          .value.branchList![index].branchName,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            homeController
                                                    .getStoreListData
                                                    .value
                                                    .branchList![index]
                                                    .branchName ??
                                                "",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            homeController.ditanceList[index] ==
                                                    true
                                                ? "Available"
                                                : "not Available",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    )),
                            value: selectedValue,
                            onChanged: (value) {
                              selected = value ==
                                      homeController.getStoreListData.value
                                          .branchList![0].branchName
                                  ? 0
                                  : value ==
                                          homeController.getStoreListData.value
                                              .branchList![0].branchName
                                      ? 1
                                      : 2;
                              homeController.ditanceList[selected!] == true
                                  ? setState(() {
                                      selectedValue = value;
                                    })
                                  : null;
                            },
                            customButton: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/shoplocation.png",
                                  fit: BoxFit.cover,
                                  height: 40,
                                  width: 40,
                                ),
                                Text(
                                  selectedValue ?? "Branch",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              offset: const Offset(0, -10),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height20,
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: Get.height * 0.2,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/images/burger2.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Everyday",
                      style: AppTextStyle.normalBold28
                          .copyWith(color: appMainColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 300,
                      child: Obx(
                        () => GridView.builder(
                            padding: EdgeInsets.all(10),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 4.5,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 30),
                            itemCount: homeController.getCategoryListModel.value
                                    .categoryList?.length ??
                                0,
                            itemBuilder: (BuildContext ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => TifinTypeScreen(
                                        fromTiffin: true,
                                        categoryName: homeController
                                                .getCategoryListModel
                                                .value
                                                .categoryList?[index]
                                                .categoryName ??
                                            "Tiffin",
                                      ));
                                },
                                child: Container(
                                  height: Get.height * 0.3,
                                  width: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1000),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                      color: primaryWhite),
                                  child: Column(
                                    children: [
                                      Obx(
                                        () => Container(
                                          margin: EdgeInsets.all(10),
                                          height: 150,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      homeController
                                                              .getCategoryListModel
                                                              .value
                                                              .categoryList?[
                                                                  index]
                                                              .categoryImage ??
                                                          ""),
                                                  fit: BoxFit.cover),
                                              shape: BoxShape.circle,
                                              color: appMainColor),
                                        ),
                                      ),
                                      height15,
                                      Obx(
                                        () => Text(
                                          homeController
                                                  .getCategoryListModel
                                                  .value
                                                  .categoryList?[index]
                                                  .categoryName ??
                                              "",
                                          style: AppTextStyle.normalSemiBold26
                                              .copyWith(
                                                  color: appMainColorLite),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
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
                    "assets/images/homevector.png",
                    height: 100,
                    width: 100,
                  )),
            ],
          ),
        ));
  }
}
