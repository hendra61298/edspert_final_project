import 'package:flutter/material.dart';
import 'package:submission_finpro/common/const/image_assets.dart';

import '../../common/style/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Image.asset(ImageAssets.imageLogoWhitePng),
      ),
    );
  }
}
