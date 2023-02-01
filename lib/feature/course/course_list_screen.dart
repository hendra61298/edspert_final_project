
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/feature/exercise/list/exercise_list_screen.dart';

import '../../core/router/routes.dart';
import '../../domain/entities/course_data.dart';
import 'course_list_controller.dart';

class CourseListScreen extends GetView<CourseListController> {
  const CourseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Pelajaran'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: GetBuilder<CourseListController>(
          builder: (CourseListController courseController) {
            List<CourseData> courses = courseController.courseList;

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(courses[index].courseName ?? ''),
                  onTap: () {
                    Get.toNamed(
                      Routes.exerciseList,
                      arguments: ExerciseListScreenArgs(
                        courseId: courses[index].courseId!,
                        courseName: courses[index].courseName ?? '',
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

