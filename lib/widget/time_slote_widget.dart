import 'package:flutter/material.dart';
import 'package:vandana/Models/get_time_slot_model.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/controllers/billing_controller.dart';
import 'package:vandana/widget/radio_button_widget.dart';
import 'package:get/get.dart';

void showTimeSlotePopUP(
  BuildContext context,
  List TimeSlotList,
  bool fromLunh,
) {
  print("List data check ==> ${TimeSlotList.length}");
  BillingController billingController = Get.put(BillingController());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Selct Time Slot",
                style: AppTextStyle.normalBold20
                    .copyWith(color: appMainColor, fontWeight: FontWeight.w500),
              ),
              height10,
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: TimeSlotList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        fromLunh == true
                            ? billingController.selectedLunchTime.value =
                                TimeSlotList[index].timeslot
                            : billingController.selectedDinnerTime.value =
                                TimeSlotList[index].timeslot;
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                              TimeSlotList[index].timeslot,
                              style: AppTextStyle.normalRegular16
                                  .copyWith(color: appMainColorLite),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
