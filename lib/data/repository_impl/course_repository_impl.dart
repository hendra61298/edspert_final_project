
import 'package:flutter/foundation.dart';
import 'package:submission_finpro/domain/repository/course_repository.dart';

import '../../common/const/urls.dart';
import '../../domain/entities/course_data.dart';
import '../../domain/entities/exercise_list_data.dart';
import '../../domain/entities/exercise_result_data.dart';
import '../../domain/entities/question_list_data.dart';
import '../models/response/course/course_response.dart';
import '../models/response/exercise/exercise_list_response.dart';
import '../models/response/exercise/exercise_result_response.dart';
import '../models/response/question/question_list_response.dart';
import '../services/dio_client.dart';

class CourseRepositoryImpl extends CourseRepository{
  final DioClient dioClient;

  CourseRepositoryImpl(this.dioClient);

  @override
  Future<List<CourseData>> getCourses({required String majorName, required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.courseList,
        queryParameters: {
          "major_name": majorName,
          "user_email": email,
        },
      );

      CourseResponse res = CourseResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getCourses: $e, $stackTrace');
      }
      return [];
    }
  }

  @override
  Future<ExerciseResultData?> getExerciseResult({required String exerciseId, required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.exerciseResult,
        queryParameters: {
          "exercise_id": exerciseId,
          "user_email": email,
        },
      );

      ExerciseResultResponse res = ExerciseResultResponse.fromJson(result);
      return res.data;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getExerciseResult: $e, $stackTrace');
      }
      return null;
    }
  }

  @override
  Future<List<ExerciseListData>> getExercisesByCourse({required String courseId, required String email}) async {
    try {
      final result = await dioClient.get(
        Urls.exerciseList,
        queryParameters: {
          "course_id": courseId,
          "user_email": email,
        },
      );

      ExerciseListResponse res = ExerciseListResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getExercisesByCourse: $e, $stackTrace');
      }
      return [];
    }
  }

  @override
  Future<List<QuestionListData>> getQuestions({required String exerciseId, required String email}) async {
    try {
      final result = await dioClient.post(
        Urls.exerciseQuestionsList,
        body: {
          "exercise_id": exerciseId,
          "user_email": email,
        },
      );

      QuestionListResponse res = QuestionListResponse.fromJson(result);
      return res.data ?? [];
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err getQuestions: $e, $stackTrace');
      }
      return [];
    }
  }

  @override
  Future<bool> submitAnswers(
      {required String exerciseId,
        required List<String> questionIds,
        required List<String> answers,
        required String email}) async {
    try {
      final result = await dioClient.post(
        Urls.submitExerciseAnswers,
        body: {
          "user_email": email,
          "exercise_id": exerciseId,
          "bank_question_id": questionIds,
          "student_answer": answers,
        },
      );

      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Err submitAnswers: $e, $stackTrace');
      }
      return false;
    }
  }
}