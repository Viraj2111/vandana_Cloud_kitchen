import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vandana/Services/storage_services.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/Views/draweer_screen.dart';
import 'package:vandana/Views/thankyou_screen.dart';
import 'package:vandana/components/storage_key_constant.dart';
import 'package:vandana/widget/text_widgets/input_text_field_widget.dart';

class AddAddressScreen extends StatefulWidget {
  AddAddressScreen({super.key, required this.fromAuth});

  bool? fromAuth;

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController homeAddressLineone = TextEditingController();

  TextEditingController homeAddressLineTow = TextEditingController();

  TextEditingController officeAddressControllerLineOne =
      TextEditingController();

  TextEditingController officeAddressControllerLineTwo =
      TextEditingController();

  setToLocal() async {
    String homeAddress =
        await homeAddressLineone.text + " " + homeAddressLineTow.text;
    String officeAddress = await officeAddressControllerLineOne.text +
        " " +
        officeAddressControllerLineTwo.text;
    StorageServices.setData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.homeAddress,
        stringData: homeAddress);
    StorageServices.setData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.homeAddressLineOne,
        stringData: homeAddressLineone.text);
    StorageServices.setData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.homeAddressLineTwo,
        stringData: homeAddressLineTow.text);
    StorageServices.setData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.officeAddress,
        stringData: officeAddress);
    StorageServices.setData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.officeAddressLineOne,
        stringData: officeAddressControllerLineOne.text);
    StorageServices.setData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.officeAddressLineTwo,
        stringData: officeAddressControllerLineTwo.text);
  }

  getFormLocal() {
    homeAddressLineone.text = StorageServices.getData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.homeAddressLineOne);
    homeAddressLineTow.text = StorageServices.getData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.homeAddressLineTwo);
    officeAddressControllerLineOne.text = StorageServices.getData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.officeAddressLineOne);
    officeAddressControllerLineTwo.text = StorageServices.getData(
        dataType: StorageKeyConstant.stringType,
        prefKey: StorageKeyConstant.officeAddressLineTwo);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFormLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/addressVector.png",
              height: Get.height * 0.269),
          Stack(
            children: [
              Image.asset("assets/images/addressBG.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHeight(50),
                    Text(
                      "ADDRESS",
                      style: AppTextStyle.normalSemiBold22.copyWith(
                          fontSize: 35,
                          color: whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    height20,
                    height20,
                    // Row(
                    //   children: [
                    //     Icon(Icons.add_circle, size: 40),
                    //     width15,
                    // Text(
                    //   "Add New Address",
                    //   style: AppTextStyle.normalRegular18.copyWith(
                    //       color: whiteColor, fontWeight: FontWeight.w500),
                    // ),
                    //   ],
                    // ),
                    Text(
                      "Home address",
                      style: AppTextStyle.normalRegular18.copyWith(
                          color: whiteColor, fontWeight: FontWeight.w500),
                    ),
                    height20,
                    textFormField(
                      controller: homeAddressLineone,
                      filledColor: primaryWhite,
                      borderRaduis: 10,
                      cursorColor: primaryBlack,
                      hintText: "Address Line 1",
                    ),
                    height20,
                    textFormField(
                      controller: homeAddressLineTow,
                      filledColor: primaryWhite,
                      borderRaduis: 10,
                      cursorColor: primaryBlack,
                      hintText: "Address Line 2",
                    ),
                    height20,
                    // Row(
                    //   children: [
                    //     Icon(Icons.add_circle, size: 40),
                    //     width15,
                    // Text(
                    //   "Add New Address",
                    //   style: AppTextStyle.normalRegular18.copyWith(
                    //       color: whiteColor, fontWeight: FontWeight.w500),
                    // ),
                    //   ],
                    // ),
                    Text(
                      "Office address (optional)",
                      style: AppTextStyle.normalRegular18.copyWith(
                          color: whiteColor, fontWeight: FontWeight.w500),
                    ),
                    height20,
                    textFormField(
                      controller: officeAddressControllerLineOne,
                      filledColor: primaryWhite,
                      borderRaduis: 10,
                      cursorColor: primaryBlack,
                      hintText: "Address Line 1",
                    ),
                    height20,
                    textFormField(
                      controller: officeAddressControllerLineTwo,
                      filledColor: primaryWhite,
                      borderRaduis: 10,
                      cursorColor: primaryBlack,
                      hintText: "Address Line 2",
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset("assets/images/bottomCurve.png")),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () async {
                      await setToLocal();
                      widget.fromAuth == true
                          ? Get.offAll(() => MainDrawerScreen(),
                              duration: Duration(milliseconds: 450),
                              transition: Transition.rightToLeft)
                          : Get.to(
                              () => ThankYouScreen(
                                fromWhere: "home",
                              ),
                            );
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      alignment: Alignment.center,
                      height: 50,
                      width: Get.width,
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
                        "Save",
                        style: AppTextStyle.normalBold24.copyWith(
                            color: appMainColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
