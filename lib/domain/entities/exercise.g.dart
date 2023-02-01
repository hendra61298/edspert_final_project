// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      exerciseId: json['exercise_id'] as String?,
      exerciseCode: json['exercise_code'] as String?,
      fileCourse: json['file_course'] as String?,
      icon: json['icon'] as String?,
      exerciseTitle: json['exercise_title'] as String?,
      exerciseDescription: json['exercise_description'] as String?,
      exerciseInstruction: json['exercise_instruction'] as String?,
      countQuestion: json['count_question'] as String?,
      classFk: json['class_fk'] as String?,
      courseFk: json['course_fk'] as String?,
      courseContentFk: json['course_content_fk'] as String?,
      subCourseContentFk: json['sub_course_content_fk'] as String?,
      creatorId: json['creator_id'] as String?,
      creatorName: json['creator_name'] as String?,
      examFrom: json['exam_from'] as String?,
      accessType: json['access_type'] as String?,
      exerciseOrder: json['exercise_order'] as String?,
      exerciseStatus: json['exercise_status'] as String?,
      dateCreate: json['date_create'] as String?,
      dateUpdate: json['date_update'] as String?,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'exercise_id': instance.exerciseId,
      'exercise_code': instance.exerciseCode,
      'file_course': instance.fileCourse,
      'icon': instance.icon,
      'exercise_title': instance.exerciseTitle,
      'exercise_description': instance.exerciseDescription,
      'exercise_instruction': instance.exerciseInstruction,
      'count_question': instance.countQuestion,
      'class_fk': instance.classFk,
      'course_fk': instance.courseFk,
      'course_content_fk': instance.courseContentFk,
      'sub_course_content_fk': instance.subCourseContentFk,
      'creator_id': instance.creatorId,
      'creator_name': instance.creatorName,
      'exam_from': instance.examFrom,
      'access_type': instance.accessType,
      'exercise_order': instance.exerciseOrder,
      'exercise_status': instance.exerciseStatus,
      'date_create': instance.dateCreate,
      'date_update': instance.dateUpdate,
    };
