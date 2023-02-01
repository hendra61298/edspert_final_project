import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/data/repository_impl/auth_repository_impl.dart';


import '../../../data/services/firebase_auth_service.dart';
import '../../core/router/routes.dart';
import '../../data/models/response/user/user_response.dart';
import '../../domain/repository/auth_repository.dart';

class LoginController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final AuthRepositoryImpl authRepositoryImpl;

  LoginController({required this.firebaseAuthService, required this.authRepositoryImpl});


  /// Steps:
  /// 1. Sign In With Google
  /// 2. Get Email from UserCredential
  /// 3. Check isUserRegistered()
  Future<void> onGoogleSignIn() async {
    User? user = await firebaseAuthService.signInWithGoogle();
    if (user != null) {
      await isUserRegistered();
    }
  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }

  Future<void> isUserRegistered() async {
    String? email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) {
      UserData? userData = await authRepositoryImpl.getUserByEmail(email: email);
      if (userData?.userEmail != null) {
        // User is Registered
        Get.offAllNamed(Routes.dashboard);
      } else {
        // User is Signed In & Is not Registered
        Get.offAllNamed(Routes.registerForm, arguments: email);
      }
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
