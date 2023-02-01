
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/login_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        child: Text('Logout'),
        onPressed: () {
          Get.find<LoginController>().signOut();
        },
      ),
    );
  }
}
