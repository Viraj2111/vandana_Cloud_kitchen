import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vandana/app.dart';
import 'package:vandana/components/app_text_style.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/components/static_decoration.dart';
import 'package:get/get.dart';

class MyDrawerMenuView extends StatelessWidget {
  const MyDrawerMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appMainColor,
      body: SizedBox(
        child: Column(
          children: [
            customHeight(Get.height * 0.1),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1DIVMNOgmDWXjhYBbM-DIhe69hWq2t1k1ULKDF80_59k5EtmZB_-7ewVFiGihhC3G538&usqp=CAU"),
                  ),
                  width10,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       dataStorages.read("user_name") ?? "",
                        style: AppTextStyle.normalBold18,
                      ),
                      Text(
                       dataStorages.read("user_email") ?? "",
                        style: AppTextStyle.normalBold18.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            customHeight(Get.height * 0.1),
            drawerWidget(
              tabName: "My Tiffin",
              iconName: Icons.home_repair_service_outlined,
              onTapp: () {},
            ),
            drawerWidget(
              tabName: "About Us",
              iconName: Icons.account_box_outlined,
              onTapp: () {},
            ),
            drawerWidget(
              tabName: "Contact Us",
              iconName: Icons.supervisor_account_outlined,
              onTapp: () {},
            ),
            drawerWidget(
              tabName: "Support Us",
              iconName: Icons.support_agent_sharp,
              onTapp: () {},
            ),
            drawerWidget(
              tabName: "Term & Conditions",
              iconName: Icons.menu_book_rounded,
              onTapp: () {},
            ),
            drawerWidget(
              tabName: "Privacy Policy",
              iconName: Icons.lock,
              onTapp: () {},
            ),
            customHeight(Get.height * 0.2),
            Container(
              alignment: Alignment.center,
              height: 45,
              width: Get.width * 0.5,
              decoration: BoxDecoration(
                  color: primaryWhite, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Log Out", style: AppTextStyle.normalBold18.copyWith(color: appMainColor),),
                  width15,
                  Icon(
                    Icons.logout_outlined,
                    color: appMainColor,
                    size: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class drawerWidget extends StatelessWidget {
  drawerWidget(
      {super.key,
      required this.tabName,
      required this.iconName,
      required this.onTapp});
  IconData? iconName;
  String? tabName;
  void Function()? onTapp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTapp,
        child: Row(
          children: [
            Icon(iconName!),
            width15,
            Text(
              tabName!,
              style: AppTextStyle.normalRegular16.copyWith(color: primaryWhite),
            ),
          ],
        ),
      ),
    );
  }
}
