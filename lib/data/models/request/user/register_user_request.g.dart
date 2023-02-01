// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBody _$UserBodyFromJson(Map<String, dynamic> json) => UserBody(
      fullName: json['nama_lengkap'] as String,
      email: json['email'] as String,
      schoolName: json['nama_sekolah'] as String,
      schoolLevel: json['jenjang'] as String,
      schoolGrade: json['kelas'] as String,
      gender: json['gender'] as String,
      photoUrl: json['foto'] as String?,
    );

Map<String, dynamic> _$UserBodyToJson(UserBody instance) => <String, dynamic>{
      'nama_lengkap': instance.fullName,
      'email': instance.email,
      'nama_sekolah': instance.schoolName,
      'jenjang': instance.schoolLevel,
      'kelas': instance.schoolGrade,
      'gender': instance.gender,
      'foto': instance.photoUrl,
    };
