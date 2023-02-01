
import 'package:get/get.dart';

import '../../../data/repository_impl/course_repository_impl.dart';
import '../../../data/services/dio_client.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../domain/repository/course_repository.dart';
import 'exercise_list_controller.dart';

class ExerciseListBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<DioClient>(() => DioClientImpl());
    Get.lazyPut<FirebaseAuthService>(() => FirebaseAuthServiceImpl());
    Get.lazyPut<CourseRepository>(() => CourseRepositoryImpl(Get.find<DioClient>()));
    Get.lazyPut(() => ExerciseListController(Get.find<CourseRepositoryImpl>(), Get.find<FirebaseAuthService>()));
  }
}