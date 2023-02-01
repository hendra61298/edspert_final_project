
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/course_data.dart';

part 'course_response.g.dart';

@JsonSerializable()
class CourseResponse {
  int? status;
  String? message;
  List<CourseData>? data;

  CourseResponse({this.status, this.message, this.data});

  factory CourseResponse.fromJson(Map<String, dynamic> json) => _$CourseResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CourseResponseToJson(this);
}