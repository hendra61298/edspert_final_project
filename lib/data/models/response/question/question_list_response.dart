
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/question_list_data.dart';

part 'question_list_response.g.dart';

@JsonSerializable()
class QuestionListResponse{
  int? status;
  String? message;
  List<QuestionListData>? data;

  QuestionListResponse({this.status, this.message, this.data});

  factory QuestionListResponse.fromJson(Map<String, dynamic> json) => _$QuestionListResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$QuestionListResponseToJson(this);
}