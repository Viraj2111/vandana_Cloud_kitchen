import 'package:flutter/material.dart';
import 'package:vandana/components/colors.dart';
import 'package:vandana/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vandana/pages/home_screens/screens/cart_screen.dart';
import 'package:vandana/pages/home_screens/screens/home_screen.dart';
import 'package:vandana/pages/home_screens/screens/profile_screen.dart';
import 'package:vandana/pages/home_screens/screens/tifin_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  HomeController homeController = Get.put(HomeController());
final List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    TifinScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body:
          Obx(() => screens[homeController.selectedIndex.value]),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xffF68D2D),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: GNav(
            rippleColor:Color(0xffF68D2D),
            hoverColor: Color(0xffF68D2D),
            gap: 8,
            activeColor: primaryWhite,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Color(0xffEC6223),
            backgroundColor: Color(0xffF68D2D),
            color: primaryWhite,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.lunch_dining_outlined,
                text: 'Food',
              ),
              GButton(
                icon: Icons.card_travel_rounded,
                text: 'Tifin',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
              ),
            ],
            selectedIndex: homeController.selectedIndex.value,
            onTabChange: (index) {
              homeController.selectedIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
