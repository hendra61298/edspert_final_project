
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      Routes.exerciseList,
                      arguments: ExerciseListScreenArgs(
                        courseId: courses[index].courseId!,
                        courseName: courses[index].courseName ?? '',
                      ),
                    );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl: courses[index].urlCover ?? "",
                            width: 60,
                            errorWidget:  ( context,  exception,  stackTrace){
                              return const Text('Error Image...');
                            },
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 300,
                              child: ListTile(
                                title: Text(courses[index].courseName ?? ""),
                                subtitle: Text("${courses[index].jumlahDone.toString()}/${courses[index].jumlahMateri.toString()} Paket Latihan Soal"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                              child: LinearPercentIndicator(
                                width: 250,
                                lineHeight: 10,
                                percent: courses[index].jumlahDone!/courses[index].jumlahMateri!,
                                progressColor: Colors.blue,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

