import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/Views/thankyou_screen.dart';
import 'package:vandana/widget/dottedline_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CancleTiffinScreen extends StatelessWidget {
  CancleTiffinScreen({super.key});

  DateTime? picked;
  DateTime selectedDate = DateTime.now();
  RxBool isSelected = false.obs;
  RxString convertedDate = "".obs;
  Future<void> selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked!;
      convertedDate.value = DateFormat('yyyy-MM-dd').format(selectedDate);
      isSelected.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          
          children: [
            Positioned(
              left: 0,
              top: Get.height * 0.7,
              bottom: Get.height * 0.1,
              child: Image.asset(
                "assets/images/leftShape.png",
              )),
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
               
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cancle Tiffin",
                  style: AppTextStyle.normalBold24.copyWith(color: appMainColor),
                ),
                Text(
                  "Your Tiffin Subseption!",
                  style:
                      AppTextStyle.normalBold24.copyWith(color: appMainColorLite),
                ),
                customHeight(50),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {},
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
                                    image: AssetImage("assets/images/gujthali.jpg"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            width15,
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
                                  "2 Chapati, 2 sabji, \n1 plate Rise, Dal, Salad",
                                  style: AppTextStyle.normalSemiBold18.copyWith(
                                      color: appMainColorLite,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                        height20,
                        Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: appMainColor)),
                              child: Text(
                                "Total Count",
                                style: AppTextStyle.normalSemiBold18.copyWith(
                                    color: appMainColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            customWidth(50),
                            Text(
                              "RS. 150",
                              style: AppTextStyle.normalSemiBold22
                                  .copyWith(fontSize: 30, color: appMainColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                HorizontalDottedLine(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(
                        "Select Date",
                        textAlign: TextAlign.start,
                        style: AppTextStyle.normalSemiBold18.copyWith(
                            color: appMainColor, fontWeight: FontWeight.w400),
                      ),
                      width15,
                      Obx(
                        () => GestureDetector(
                            onTap: () {
                              selectDate(context);
                            },
                            child: isSelected.value == true
                                ? Text(
                                    convertedDate.value,
                                    textAlign: TextAlign.start,
                                    style: AppTextStyle.normalSemiBold18.copyWith(
                                        color: appMainColor,
                                        fontWeight: FontWeight.w400),
                                  )
                                : Icon(
                                    Icons.date_range_outlined,
                                    color: appMainColor,
                                  )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: appMainColor),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appMainColor,
                          ),
                        ),
                      ),
                      width10,
                      Text(
                        "Saturday:- 200*4 = 800",
                        style: AppTextStyle.normalRegular17.copyWith(
                            color: appMainColor, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                height10,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: appMainColor),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appMainColor,
                          ),
                        ),
                      ),
                      width10,
                      Text(
                        "Sunday:- 200*4 = 800",
                        style: AppTextStyle.normalRegular17.copyWith(
                            color: appMainColor, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                customHeight(80),
                  GestureDetector(
                        onTap: () {
                        Get.to(()=> ThankYouScreen(fromWhere: "tiffin",));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 30),
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
                            "Procced Continue",
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
            
          ],
        ),
      ),
    );
  }
}
