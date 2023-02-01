
import 'package:get/get.dart';
import 'package:submission_finpro/data/repository_impl/course_repository_impl.dart';

import '../../data/services/dio_client.dart';
import '../../data/services/firebase_auth_service.dart';
import 'course_list_controller.dart';

class CourseListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRepositoryImpl>(() => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => CourseListController(Get.find<CourseRepositoryImpl>(), Get.find<FirebaseAuthService>()));
  }
}