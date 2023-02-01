
import 'package:get/get.dart';
import 'package:submission_finpro/data/repository_impl/course_repository_impl.dart';

import '../../../core/router/routes.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../domain/entities/exercise_result_data.dart';
import '../../../domain/entities/question_list_data.dart';

class ExerciseQuestionsFormController extends GetxController {
  final CourseRepositoryImpl courseRepository;
  final FirebaseAuthService firebaseAuthService;

  ExerciseQuestionsFormController(this.courseRepository, this.firebaseAuthService);

  // Currently set to static
  late String exerciseId;

  @override
  void onInit() {
    super.onInit();

    exerciseId = Get.arguments as String;
    getQuestions();
  }

  /// Questions
  List<QuestionListData> questionList = [];

  /// Get Dari API Get Questions
  Future<void> getQuestions() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      List<QuestionListData> result = await courseRepository.getQuestions(exerciseId: exerciseId, email: email);
      questionList = result;
      if (questionList.isNotEmpty) {
        activeQuestionId = questionList.first.questionId!;
      }
      update();
    }
  }

  /// Answers
  List<QuestionAnswer> questionAnswers = [];
  int activeQuestionIndex = 0;
  String activeQuestionId = '';
  bool submitAnswerLoading = false;

  void navigateToQuestionIndex(int index) {
    activeQuestionIndex = index;
    try {
      activeQuestionId = questionList[activeQuestionIndex].questionId ?? '';
    } catch (e) {
      // Ignore
    }
    update();
  }

  void updateAnswerToQuestion({required String questionId, required String answer}) {
    if (questionAnswers.any((element) => element.questionId == questionId)) {
      int indexToUpdate = questionAnswers.indexWhere((element) => element.questionId == questionId);
      questionAnswers[indexToUpdate] = QuestionAnswer(questionId: questionId, answer: answer);
    } else {
      print('question: $questionId');
      questionAnswers.add(QuestionAnswer(questionId: questionId, answer: answer));
    }
    update();
  }

  Future<void> submitAnswers() async {
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {
      submitAnswerLoading = true;
      update();

      if (questionAnswers.length == 10) {
        List<String> questionIds = questionAnswers.map((e) => e.questionId).toList();
        List<String> answers = questionAnswers.map((e) => e.answer).toList();

        /// Submit Answer API Call
        bool submitAnswersResult = await courseRepository.submitAnswers(
          email: email,
          exerciseId: exerciseId,
          questionIds: questionIds,
          answers: answers,
        );

        if (submitAnswersResult == true) {
          /// Get Exercise Result API Call
          ExerciseResultData? exerciseResult =
          await courseRepository.getExerciseResult(exerciseId: exerciseId, email: email);
          if (exerciseResult != null) {
            Get.offNamed(Routes.exerciseResult, arguments: exerciseResult.result?.jumlahScore ?? "0");
          }
        }
        submitAnswerLoading = false;
        update();
      } else {
        Get.snackbar('Semua harus diisi!', 'Periksa kembali jawaban anda.');
      }

    }
  }
}

class QuestionAnswer {
  final String questionId;
  final String answer;

  @override
  String toString() {
    return 'QuestionAnswer{questionId: $questionId, answer: $answer}';
  }

  QuestionAnswer({required this.questionId, required this.answer});
}
