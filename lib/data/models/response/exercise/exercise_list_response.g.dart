// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseListResponse _$ExerciseListResponseFromJson(
        Map<String, dynamic> json) =>
    ExerciseListResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ExerciseListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExerciseListResponseToJson(
        ExerciseListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
