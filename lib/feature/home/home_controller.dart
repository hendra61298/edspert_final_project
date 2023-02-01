
import 'package:get/get.dart';
import 'package:submission_finpro/data/repository_impl/banner_repository_impl.dart';
import 'package:submission_finpro/data/repository_impl/course_repository_impl.dart';

import '../../data/services/firebase_auth_service.dart';
import '../../domain/entities/course_data.dart';


class HomeController extends GetxController{
  final FirebaseAuthService firebaseAuthService;
  final CourseRepositoryImpl courseRepository;
  final BannerRepositoryImpl bannerRepository;

  HomeController(this.firebaseAuthService, this.courseRepository, this.bannerRepository);

  List<CourseData> courseList = [];

  // Currently set to static
  String majorName = 'IPA';

  Future<void> getCourses() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<CourseData> result = await courseRepository.getCourses(
        majorName: majorName,
        email: email,
      );
      courseList = result;
      update();
    }
  }
}