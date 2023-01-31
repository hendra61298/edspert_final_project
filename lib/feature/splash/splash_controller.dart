
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/data/repository_impl/auth_repository_impl.dart';


import '../../core/router/routes.dart';
import '../../data/models/response/user/user_response.dart';
import '../../data/services/firebase_auth_service.dart';
import '../../domain/repository/auth_repository.dart';


class SplashController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final AuthRepositoryImpl authRepositoryImpl;

  SplashController({
    required this.authRepositoryImpl,
    required this.firebaseAuthService,
  });

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
      await isUserSignedIn();
    });
  }

  Future<void> isUserSignedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await isUserRegistered();
    } else {
      // User is Not Signed In
      // Navigate to Login Page
      Get.offAllNamed(Routes.login);
    }
  }

  Future<void> isUserRegistered() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      UserData? userData = await authRepositoryImpl.getUserByEmail(email: email);
      if (userData?.userEmail != null) {
        // User is Registered
        // Navigate to Dashboard Page
        Get.offAllNamed(Routes.dashboard);
      } else {
        // User is Signed In & Is not Registered
        // Navigate to Register Form Page
        Get.offAllNamed(Routes.registerForm);
      }
    } else {
      // User is Not Signed In
      // Navigate to Login Page
      Get.offAllNamed(Routes.login);
    }
  }
}
