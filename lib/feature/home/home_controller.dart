
import 'package:get/get.dart';
import 'package:submission_finpro/data/repository_impl/banner_repository_impl.dart';
import 'package:submission_finpro/data/repository_impl/course_repository_impl.dart';
import 'package:submission_finpro/domain/entities/banner_data.dart';

import '../../data/models/response/user/user_response.dart';
import '../../data/repository_impl/auth_repository_impl.dart';
import '../../data/services/firebase_auth_service.dart';
import '../../domain/entities/course_data.dart';


class HomeController extends GetxController{
  final FirebaseAuthService firebaseAuthService;
  final CourseRepositoryImpl courseRepository;
  final BannerRepositoryImpl bannerRepository;
  final AuthRepositoryImpl authRepositoryImpl;

  HomeController(this.firebaseAuthService, this.courseRepository, this.bannerRepository, this.authRepositoryImpl);

  List<CourseData> courseList = [];
  UserData? userData;
  // Currently set to static
  String majorName = 'IPA';
  List<BannerData> bannerList = [];

  @override
  void onInit() {
    super.onInit();
  }

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

  Future<void> getLoginUser() async{
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    userData = await authRepositoryImpl.getUserByEmail(email: email!);
    update();
  }

  Future<void> getBanner() async {
    bannerList = await bannerRepository.getBanners();
    update();
  }
}