
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/common/const/image_assets.dart';
import 'package:submission_finpro/common/style/app_color.dart';


import '../../widgets/signin_google_button.dart';
import 'login_controller.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 36),
              SvgPicture.asset(
                ImageAssets.imageIllustrationLoginSvg,
                height: 255,
              ),
              const SizedBox(height: 60),
              const Text(
                'Selamat Datang',
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Selamat Datang di Aplikasi Widya Edu Aplikasi Latihan dan Konsultasi Soal',
                style: TextStyle(
                  color: AppColor.grey6A,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const Expanded(child: SizedBox()),
              SocialLoginButton(
                text: 'Masuk dengan Google',
                iconAsset: ImageAssets.iconGooglePng,
                outlineBorderColor: AppColor.mint,
                onPressed: () async {
                  await Get.find<LoginController>().onGoogleSignIn();
                },
              ),
              const SizedBox(height: 25),
              SocialLoginButton(
                text: 'Masuk dengan Apple ID',
                iconAsset: ImageAssets.iconApplePng,
                backgroundColor: AppColor.black,
                textColor: Colors.white,
                onPressed: () {},
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
