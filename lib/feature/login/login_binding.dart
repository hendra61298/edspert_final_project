import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../data/repository_impl/auth_repository_impl.dart';
import '../../data/services/dio_client.dart';
import '../../data/services/firebase_auth_service.dart';
import '../../domain/repository/auth_repository.dart';
import 'login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());

    Get.lazyPut(() => LoginController(
      authRepository: Get.find<AuthRepository>(),
      firebaseAuthService: Get.find<FirebaseAuthService>(),
    ));
  }
}