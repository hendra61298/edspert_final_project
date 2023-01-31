
import 'package:get/get.dart';
import 'package:submission_finpro/data/services/dio_client.dart';
import 'package:submission_finpro/feature/splash/splash_controller.dart';

import '../../data/repository_impl/auth_repository_impl.dart';
import '../../data/services/firebase_auth_service.dart';
import '../../domain/repository/auth_repository.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRepositoryImpl>(() => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.put(SplashController(
      authRepositoryImpl: Get.find<AuthRepositoryImpl>(),
      firebaseAuthService: Get.find<FirebaseAuthService>(),
    ));
  }

}