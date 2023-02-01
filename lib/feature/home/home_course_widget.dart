

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/feature/exercise/list/exercise_list_screen.dart';

import '../../core/router/routes.dart';
import '../../domain/entities/course_data.dart';
import 'home_controller.dart';

class HomeCourseWidget extends StatefulWidget {
  const HomeCourseWidget({Key? key}) : super(key: key);

  @override
  State<HomeCourseWidget> createState() => _HomeCourseWidgetState();
}

class _HomeCourseWidgetState extends State<HomeCourseWidget> {
  @override
  void initState() {
    Get.find<HomeController>().getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int maxCourseCount = 3;

    return GetBuilder<HomeController>(
      builder: (controller) {
        List<CourseData> courses = controller.courseList;
        return Column(
          children: [
            if (courses.length > maxCourseCount)
              TextButton(
                child: const Text('Lihat Semua'),
                onPressed: () {
                  Get.toNamed(Routes.courseList);
                },
              ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: courses.length > maxCourseCount ? maxCourseCount : courses.length,
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
            ),
          ],
        );
      },
    );
  }
}
