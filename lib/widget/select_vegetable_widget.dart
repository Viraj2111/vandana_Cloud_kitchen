import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/controllers/billing_controller.dart';

class SelectVegetableWidget extends StatelessWidget {
  SelectVegetableWidget({super.key, required this.vegeTableList});
 
  RxInt selectedSabji = 0.obs;
  List vegeTableList;
  // BillingController billingController = Get.find<BillingController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          height10,
          ...List.generate(
              vegeTableList.length,
              (index) => Obx(
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
                                color: selectedSabji != index
                                   ? appMainColor.withOpacity(0.3)
                                  : appMainColor,),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedSabji != index
                                  ? appMainColor.withOpacity(0.3)
                                  : appMainColor,
                            ),
                          ),
                        ),
                        width15,
                        Text(
                          vegeTableList[index].sabji,
                          style: AppTextStyle.normalBold16
                              .copyWith(fontSize: 18, color: appMainColor),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
