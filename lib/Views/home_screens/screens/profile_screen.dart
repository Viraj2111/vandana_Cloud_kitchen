import 'package:flutter/material.dart';
import 'package:vandana/app.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/buttons/text_button.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/common_methos.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:vandana/Views/auth_screens/signup_screen.dart';
import 'package:vandana/widget/text_widgets/input_text_field_widget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  getFromLocal() async {
    nameController.text = await dataStorages.read("user_name") ?? "";
    emailController.text = await dataStorages.read("user_email") ?? "";
    mobileController.text = await dataStorages.read("user_mobile") ?? "";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFromLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(color: primaryWhite),
        ),
        backgroundColor: appMainColorLite,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 70,
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            ),
            height20,
            textFormField(
              controller: nameController,
              filledColor: primaryWhite.withOpacity(0.8),
              borderRaduis: 10,
              enabled: false,
              cursorColor: primaryBlack,
              hintText: "Name",
              hintStyle: AppTextStyle.normalBold14
                  .copyWith(color: primaryBlack.withOpacity(.5)),
            ),
            height20,
            textFormField(
              controller: mobileController,
              filledColor: primaryWhite.withOpacity(0.8),
              borderRaduis: 10,
              enabled: false,
              cursorColor: primaryBlack,
              hintText: "Mobile Number",
              hintStyle: AppTextStyle.normalBold14
                  .copyWith(color: primaryBlack.withOpacity(.5)),
              maxLength: 10,
            ),
            textFormField(
              controller: emailController,
              filledColor: primaryWhite.withOpacity(0.8),
              borderRaduis: 10,
              enabled: false,
              cursorColor: primaryBlack,
              hintText: "Email Address",
              hintStyle: AppTextStyle.normalBold14
                  .copyWith(color: primaryBlack.withOpacity(.5)),
            ),
            height20,
            PrimaryTextButton(
              title: "Log Out",
              onPressed: () async {
                await dataStorages.erase();
                CommonMethod().getXSnackBar("Log Out",
                    "User has been loged out successfully..", greenColor);
                Get.offAll(() => SignupScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
