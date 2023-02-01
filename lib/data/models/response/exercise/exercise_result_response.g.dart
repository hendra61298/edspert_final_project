// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseResultResponse _$ExerciseResultResponseFromJson(
        Map<String, dynamic> json) =>
    ExerciseResultResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ExerciseResultData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExerciseResultResponseToJson(
        ExerciseResultResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
