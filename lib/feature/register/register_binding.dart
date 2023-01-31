
import 'package:get/get.dart';
import 'package:submission_finpro/feature/register/register_controller.dart';

import '../../data/repository_impl/auth_repository_impl.dart';
import '../../data/services/dio_client.dart';
import '../../domain/repository/auth_repository.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<AuthRepositoryImpl>(() => AuthRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => RegisterController(authRepositoryImpl: Get.find<AuthRepositoryImpl>()));
  }

}