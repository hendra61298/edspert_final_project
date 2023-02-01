
import 'package:json_annotation/json_annotation.dart';
import 'package:submission_finpro/domain/entities/result.dart';

import 'exercise.dart';

part 'exercise_result_data.g.dart';

@JsonSerializable()
class ExerciseResultData{
  Exercise? exercise;
  Result? result;

  ExerciseResultData({this.exercise, this.result});

  factory ExerciseResultData.fromJson(Map<String, dynamic> json) => _$ExerciseResultDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ExerciseResultDataToJson(this);
}