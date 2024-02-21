import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/controllers/home_controller.dart';
import 'package:vandana/Views/home_screens/bottom_navigation.dart';
import 'package:vandana/Views/home_screens/screens/home_screen.dart';
import 'package:vandana/widget/custome_drawer/my_drawer.dart';
import 'package:get/get.dart';

class MainDrawerScreen extends StatefulWidget {
  const MainDrawerScreen({super.key});

  @override
  State<MainDrawerScreen> createState() => _MainDrawerScreenState();
}

class _MainDrawerScreenState extends State<MainDrawerScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: homeController.drawerController,
        style: DrawerStyle.defaultStyle,
        menuScreen: MyDrawerMenuView(),
        mainScreen: BottomNavigationScreen(),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
       menuBackgroundColor: appMainColor,
           
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}