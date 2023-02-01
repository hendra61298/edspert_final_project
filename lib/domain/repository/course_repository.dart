
import '../entities/course_data.dart';
import '../entities/exercise_list_data.dart';
import '../entities/exercise_result_data.dart';
import '../entities/question_list_data.dart';

abstract class CourseRepository {
  Future<List<CourseData>> getCourses({required String majorName, required String email});

  Future<List<ExerciseListData>> getExercisesByCourse({required String courseId, required String email});

  Future<List<QuestionListData>> getQuestions({required String exerciseId, required String email});

  Future<bool> submitAnswers({
    required String exerciseId,
    required List<String> questionIds,
    required List<String> answers,
    required String email,
  });

  Future<ExerciseResultData?> getExerciseResult({required String exerciseId, required String email});
}