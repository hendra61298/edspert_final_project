// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseListData _$ExerciseListDataFromJson(Map<String, dynamic> json) =>
    ExerciseListData(
      exerciseId: json['exercise_id'] as String?,
      exerciseTitle: json['exercise_title'] as String?,
      accessType: json['access_type'] as String?,
      icon: json['icon'] as String?,
      exerciseUserStatus: json['exercise_user_status'] as String?,
      jumlahSoal: json['jumlah_soal'] as String?,
      jumlahDone: json['jumlah_done'] as int?,
    );

Map<String, dynamic> _$ExerciseListDataToJson(ExerciseListData instance) =>
    <String, dynamic>{
      'exercise_id': instance.exerciseId,
      'exercise_title': instance.exerciseTitle,
      'access_type': instance.accessType,
      'icon': instance.icon,
      'exercise_user_status': instance.exerciseUserStatus,
      'jumlah_soal': instance.jumlahSoal,
      'jumlah_done': instance.jumlahDone,
    };
