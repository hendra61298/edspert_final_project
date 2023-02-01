
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/feature/exercise/questions_form/questions_form_controller.dart';

import '../../../domain/entities/question_list_data.dart';
import 'package:html/parser.dart' show parse;

class ExerciseFromScreen extends StatelessWidget {
  const ExerciseFromScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseQuestionsFormController>(
      builder: (controller) {
        List<QuestionListData> questions = controller.questionList;
        int activeQuestionIndex = controller.activeQuestionIndex;
        if (questions.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        QuestionListData activeQuestion = questions[activeQuestionIndex];
        String activeQuestionId = controller.activeQuestionId;
        String? selectedAnswer =
            controller.questionAnswers.firstWhereOrNull((e) => e.questionId == activeQuestionId)?.answer;

        print('questionAnswers: ${controller.questionAnswers.map((e) => '${e.questionId}-${e.answer}')}');

        return Scaffold(
          appBar: AppBar(
            title: const Text('Latihan Soal'),
          ),
          body: ListView(
            children: [
              // Question Number Horizontal ListView
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: questions.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => IconButton(
                    icon: CircleAvatar(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontWeight: index == activeQuestionIndex ? FontWeight.w800 : FontWeight.w400,
                          color: index == activeQuestionIndex ? Colors.yellow : Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      controller.navigateToQuestionIndex(index);
                    },
                  ),
                ),
              ),

              // Judul/Pertanyaan Soal
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(parse(activeQuestion.questionTitle ?? '').documentElement!.text,
                    textAlign: TextAlign.justify,
                ),
              ),

              //
              RadioListTile(
                title: Text(parse(activeQuestion.optionA).documentElement!.text ?? ''),
                value: 'A',
                groupValue: selectedAnswer,
                onChanged: (val) {
                  controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'A');
                },
              ),
              RadioListTile(
                title: Text(parse(activeQuestion.optionB).documentElement!.text  ?? ''),
                value: 'B',
                groupValue: selectedAnswer,
                onChanged: (val) {
                  controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'B');
                },
              ),
              RadioListTile(
                title: Text(parse(activeQuestion.optionC).documentElement!.text  ?? ''),
                value: 'C',
                groupValue: selectedAnswer,
                onChanged: (val) {
                  controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'C');
                },
              ),
              RadioListTile(
                title: Text(parse(activeQuestion.optionD).documentElement!.text  ?? ''),
                value: 'D',
                groupValue: selectedAnswer,
                onChanged: (val) {
                  controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'D');
                },
              ),
              RadioListTile(
                title: Text(parse(activeQuestion.optionE).documentElement!.text  ?? ''),
                value: 'E',
                groupValue: selectedAnswer,
                onChanged: (val) {
                  controller.updateAnswerToQuestion(questionId: activeQuestionId, answer: 'E');
                },
              ),

              if (activeQuestionIndex < questions.length - 1)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.navigateToQuestionIndex(activeQuestionIndex + 1);
                    },
                    child: const Text('SELANJUTNYA'),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      Get.bottomSheet(
                        Wrap(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 16),
                                const Text('Kumpulkan latihan soal sekarang?'),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const SizedBox(width: 32),
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Nanti Dulu'),
                                      ),
                                    ),
                                    const SizedBox(width: 32),
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                            controller.submitAnswers();
                                          },
                                          child: const Text('Ya')),
                                    ),
                                    const SizedBox(width: 32),
                                  ],
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ],
                        ),
                        backgroundColor: Colors.white,
                      );
                    },
                    child: const Text('KUMPULIN'),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
