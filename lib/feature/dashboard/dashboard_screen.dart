

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:submission_finpro/feature/home/home_screen.dart';
import 'package:submission_finpro/feature/profile/profile_screen.dart';

import 'dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int selectedIndex = controller.selectedNavIndex.value;
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              _bodyList()[selectedIndex],
              GetBuilder<DashboardController>(builder: (controller) {
                bool isOnline = controller.isOnline;
                if (isOnline) {
                  return SizedBox();
                } else {
                  return Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.yellow,
                      child: Text('No Connection'),
                    ),
                  );
                }
              }),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              controller.navigateTo(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_outlined),
                label: 'Diskusi Soal',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _bodyList() => [
    const HomeScreen(),
    const Center(child: Text("Comming Soon",
      style: TextStyle(
        fontWeight: FontWeight.bold
      ),
    ),),
    const ProfileScreen(),
  ];
}
