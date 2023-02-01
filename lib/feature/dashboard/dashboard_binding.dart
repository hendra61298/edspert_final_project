import 'package:get/get.dart';

import '../../data/repository_impl/auth_repository_impl.dart';
import '../../data/repository_impl/banner_repository_impl.dart';
import '../../data/repository_impl/course_repository_impl.dart';
import '../../data/services/dio_client.dart';
import '../../data/services/firebase_auth_service.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/repository/banner_repository.dart';
import '../../domain/repository/course_repository.dart';
import '../home/home_controller.dart';
import '../login/login_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRepositoryImpl>(() => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<BannerRepositoryImpl>(() => BannerRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<AuthRepositoryImpl>(() => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => LoginController(
      authRepositoryImpl: Get.find<AuthRepositoryImpl>(),
      firebaseAuthService: Get.find<FirebaseAuthService>(),
    ));
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() =>
        HomeController(Get.find<FirebaseAuthService>(), Get.find<CourseRepositoryImpl>(), Get.find<BannerRepositoryImpl>(), Get.find<AuthRepositoryImpl>()));
  }
}
