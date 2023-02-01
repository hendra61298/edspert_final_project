// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseData _$CourseDataFromJson(Map<String, dynamic> json) => CourseData(
      courseId: json['course_id'] as String?,
      majorName: json['major_name'] as String?,
      courseCategory: json['course_category'] as String?,
      courseName: json['course_name'] as String?,
      urlCover: json['url_cover'] as String?,
      jumlahMateri: json['jumlah_materi'] as int?,
      jumlahDone: json['jumlah_done'] as int?,
      progress: json['progress'] as int?,
    );

Map<String, dynamic> _$CourseDataToJson(CourseData instance) =>
    <String, dynamic>{
      'course_id': instance.courseId,
      'major_name': instance.majorName,
      'course_category': instance.courseCategory,
      'course_name': instance.courseName,
      'url_cover': instance.urlCover,
      'jumlah_materi': instance.jumlahMateri,
      'jumlah_done': instance.jumlahDone,
      'progress': instance.progress,
    };
