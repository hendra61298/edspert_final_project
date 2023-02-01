
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/exercise_result_data.dart';

part 'exercise_result_response.g.dart';

@JsonSerializable()
class ExerciseResultResponse{
  int? status;
  String? message;
  ExerciseResultData? data;

  ExerciseResultResponse({this.status, this.message, this.data});

  factory ExerciseResultResponse.fromJson(Map<String, dynamic> json) => _$ExerciseResultResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ExerciseResultResponseToJson(this);
}