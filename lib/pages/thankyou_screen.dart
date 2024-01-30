import 'package:flutter/material.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';

class ThankYouScreen extends StatelessWidget {
   ThankYouScreen({super.key, required this.fromWhere});
  String fromWhere = ""; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          fromWhere =="tiffin" ? Image.asset("assets/images/Artboard 1icons.png") : Image.asset("assets/images/thankyouVector.png"),
        height20,
          Text(
             fromWhere =="tiffin" ? "Your tiffin has\nbeen Cancelled".toUpperCase() :  "THANK\nYOU!".toUpperCase(),
            textAlign: TextAlign.center,
            style: AppTextStyle.normalBold12
                .copyWith(fontSize:fromWhere =="tiffin"? 40: 60, fontWeight: FontWeight.bold),
          )
        ],
      ),
      bottomNavigationBar: Image.asset("assets/images/bottomCurve.png"),
    );
  }
}
