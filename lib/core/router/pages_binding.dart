
import 'package:get/get_navigation/get_navigation.dart';
import 'package:submission_finpro/core/router/routes.dart';
import 'package:submission_finpro/feature/course/course_list_binding.dart';
import 'package:submission_finpro/feature/course/course_list_screen.dart';
import 'package:submission_finpro/feature/dashboard/dashboard_binding.dart';
import 'package:submission_finpro/feature/dashboard/dashboard_screen.dart';
import 'package:submission_finpro/feature/exercise/list/exercise_list_binding.dart';
import 'package:submission_finpro/feature/exercise/list/exercise_list_screen.dart';
import 'package:submission_finpro/feature/exercise/questions_form/questions_form_screen.dart';
import 'package:submission_finpro/feature/exercise/result/exercise_result_screen.dart';
import 'package:submission_finpro/feature/login/login_binding.dart';
import 'package:submission_finpro/feature/login/login_screen.dart';
import 'package:submission_finpro/feature/register/register_screen.dart';
import 'package:submission_finpro/feature/splash/splash_binding.dart';
import 'package:submission_finpro/feature/splash/splash_screen.dart';

import '../../feature/exercise/questions_form/questions_from_binding.dart';
import '../../feature/exercise/result/exercise_resultt_binding.dart';
import '../../feature/register/register_binding.dart';

class Pages{
  static final pages = [
    GetPage(name: Routes.splash, page: ()=>  const SplashScreen(), binding: SplashBinding()),
    GetPage(name: Routes.dashboard, page: ()=>  const DashboardScreen(), binding: DashboardBinding()),
    GetPage(name: Routes.login, page: ()=>  const LoginScreen(), binding:LoginBinding()),
    GetPage(name: Routes.registerForm, page: ()=>  const RegisterScreen(), binding:RegisterBinding(), arguments: String),
    GetPage(name: Routes.courseList, page: () => const CourseListScreen(), binding: CourseListBinding()),
    GetPage(
      name: Routes.exerciseList,
      page: () => const ExerciseListScreen(),
      binding: ExerciseListBinding(),
      arguments: ExerciseListScreenArgs,
    ),
    GetPage(
      name: Routes.exerciseQuestionsForm,
      page: () => const ExerciseFromScreen(),
      binding: ExerciseQuestionsFormBinding(),
      arguments: String,
    ),
    GetPage(
      name: Routes.exerciseResult,
      page: () => const ExerciseResultScreen(),
      binding: ExerciseResultBinding(),
      arguments: String,
    ),
  ];
}