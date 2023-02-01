// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionListResponse _$QuestionListResponseFromJson(
        Map<String, dynamic> json) =>
    QuestionListResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QuestionListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuestionListResponseToJson(
        QuestionListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
