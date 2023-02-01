

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 const  Text('Pilih Pelajaran',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  if (courses.length > maxCourseCount)
                  TextButton(
                    child: const Text('Lihat Semua'),
                    onPressed: () {
                      Get.toNamed(Routes.courseList);
                    },
                  ),],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: courses.length > maxCourseCount ? maxCourseCount : courses.length,
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
                            width: 60,
                            errorWidget:  ( context,  exception,  stackTrace){
                              return const Text('Error Image...');
                            }, imageUrl: courses[index].urlCover ?? "",
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
            ),
          ],
        );
      },
    );
  }
}
