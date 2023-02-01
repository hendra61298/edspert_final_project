
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/router/routes.dart';
import '../../../domain/entities/exercise_list_data.dart';
import 'exercise_list_controller.dart';

class ExerciseListScreenArgs {
  final String courseId;
  final String courseName;

  const ExerciseListScreenArgs({
    required this.courseId,
    required this.courseName,
  });
}

class ExerciseListScreen extends StatelessWidget {
  const ExerciseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExerciseListController>(
      builder: (ExerciseListController controller) {
        List<ExerciseListData> exercises = controller.exerciseList;

        return Scaffold(
          appBar: AppBar(
            title: Text(controller.courseName),
          ),
          body: controller.isExerciseListLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 3 : 2,
              childAspectRatio: 130 / 96,
              crossAxisSpacing: 14,
              mainAxisSpacing: 12,
            ),
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.exerciseQuestionsForm, arguments: exercises[index].exerciseId);
                },
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(imageUrl:exercises[index].icon!,
                        width: 50,
                        ),
                      ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(exercises[index].exerciseTitle ?? '')),
                      )),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
