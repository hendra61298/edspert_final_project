
import 'package:get/get.dart';
import 'package:submission_finpro/data/repository_impl/course_repository_impl.dart';
import 'package:submission_finpro/feature/exercise/list/exercise_list_screen.dart';

import '../../../data/services/firebase_auth_service.dart';
import '../../../domain/entities/exercise_list_data.dart';
import '../../../domain/repository/course_repository.dart';

class ExerciseListController extends GetxController{
  final CourseRepositoryImpl courseRepository;
  final FirebaseAuthService firebaseAuthService;

  ExerciseListController(this.courseRepository, this.firebaseAuthService);

  late String courseId;
  late String courseName;

  @override
  void onInit() {
    super.onInit();

    ExerciseListScreenArgs args = Get.arguments as ExerciseListScreenArgs;
    courseId = args.courseId;
    courseName = args.courseName;

    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getExercises();
    });
  }

  List<ExerciseListData> exerciseList = [];
  bool isExerciseListLoading = false;

  Future<void> getExercises() async {
    isExerciseListLoading = true;
    update();

    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<ExerciseListData> result = await courseRepository.getExercisesByCourse(courseId: courseId, email: email);
      exerciseList = result;
      isExerciseListLoading = false;
      update();
    } else {
      isExerciseListLoading = false;
      update();
    }
  }
}