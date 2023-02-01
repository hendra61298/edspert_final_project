
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/exercise_list_data.dart';

part 'exercise_list_response.g.dart';

@JsonSerializable()
class ExerciseListResponse {
  int? status;
  String? message;
  List<ExerciseListData>? data;

  ExerciseListResponse({this.status, this.message, this.data});

  factory ExerciseListResponse.fromJson(Map<String, dynamic> json) => _$ExerciseListResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ExerciseListResponseToJson(this);
}