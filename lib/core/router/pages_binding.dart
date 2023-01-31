
import 'package:get/get_navigation/get_navigation.dart';
import 'package:submission_finpro/core/router/routes.dart';
import 'package:submission_finpro/feature/dashboard/dashboard_screen.dart';
import 'package:submission_finpro/feature/login/login_binding.dart';
import 'package:submission_finpro/feature/login/login_screen.dart';
import 'package:submission_finpro/feature/splash/splash_binding.dart';
import 'package:submission_finpro/feature/splash/splash_screen.dart';

class Pages{
  static final pages = [
    GetPage(name: Routes.splash, page: ()=>  const SplashScreen(), binding: SplashBinding()),
    GetPage(name: Routes.dashboard, page: ()=>  const DashboardScreen(), binding: null),
    GetPage(name: Routes.login, page: ()=>  const LoginScreen(), binding:LoginBinding()),
  ];
}