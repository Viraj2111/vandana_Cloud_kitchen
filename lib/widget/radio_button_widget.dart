import 'package:flutter/material.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:get/get.dart';


class CustomRadioButton extends StatelessWidget {
   CustomRadioButton({super.key, required this.buttonName, required this.isSelected});
String? buttonName;
RxBool? isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          ()=>
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
                color: isSelected!.value ?  appMainColor: appMainColorLite,
              ),
            ),
          ),
        ),
        width10,
        Text(
          buttonName!,
          style: AppTextStyle.normalRegular16.copyWith(color: appMainColorLite),
        )
      ],
    );
  }
}
