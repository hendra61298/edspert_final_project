
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/common/style/app_theme.dart';
import 'package:submission_finpro/core/router/pages_binding.dart';
import 'package:submission_finpro/core/router/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Final Project",
      theme: AppTheme.theme,
      initialRoute: Routes.splash,
      getPages: Pages.pages,
    );
  }
}

