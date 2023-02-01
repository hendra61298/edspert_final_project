
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_finpro/common/style/app_color.dart';
import 'package:submission_finpro/feature/exercise/result/exercise_result_controller.dart';


class ExerciseResultScreen extends GetView<ExerciseResultController> {
  const ExerciseResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.close_outlined,
                      color: AppColor.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Tutup',
                      style: TextStyle(color: AppColor.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              const Text(
                'Selamat',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Nilai Kamu: ${controller.resultScore}',
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
