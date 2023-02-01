// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionListData _$QuestionListDataFromJson(Map<String, dynamic> json) =>
    QuestionListData(
      exerciseId: json['exercise_id_fk'] as String?,
      questionId: json['bank_question_id'] as String?,
      questionTitle: json['question_title'] as String?,
      questionTitleImg: json['question_title_img'] as String?,
      optionA: json['option_a'] as String?,
      optionAImg: json['option_a_img'] as String?,
      optionB: json['option_b'] as String?,
      optionBImg: json['option_b_img'] as String?,
      optionC: json['option_c'] as String?,
      optionCImg: json['option_c_img'] as String?,
      optionD: json['option_d'] as String?,
      optionDImg: json['option_d_img'] as String?,
      optionE: json['option_e'] as String?,
      optionEImg: json['option_e_img'] as String?,
      studentAnswer: json['student_answer'] as String?,
    );

Map<String, dynamic> _$QuestionListDataToJson(QuestionListData instance) =>
    <String, dynamic>{
      'exercise_id_fk': instance.exerciseId,
      'bank_question_id': instance.questionId,
      'question_title': instance.questionTitle,
      'question_title_img': instance.questionTitleImg,
      'option_a': instance.optionA,
      'option_a_img': instance.optionAImg,
      'option_b': instance.optionB,
      'option_b_img': instance.optionBImg,
      'option_c': instance.optionC,
      'option_c_img': instance.optionCImg,
      'option_d': instance.optionD,
      'option_d_img': instance.optionDImg,
      'option_e': instance.optionE,
      'option_e_img': instance.optionEImg,
      'student_answer': instance.studentAnswer,
    };
