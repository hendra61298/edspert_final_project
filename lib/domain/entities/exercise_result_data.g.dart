// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_result_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseResultData _$ExerciseResultDataFromJson(Map<String, dynamic> json) =>
    ExerciseResultData(
      exercise: json['exercise'] == null
          ? null
          : Exercise.fromJson(json['exercise'] as Map<String, dynamic>),
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExerciseResultDataToJson(ExerciseResultData instance) =>
    <String, dynamic>{
      'exercise': instance.exercise,
      'result': instance.result,
    };
