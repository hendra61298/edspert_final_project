// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBody _$UserBodyFromJson(Map<String, dynamic> json) => UserBody(
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      schoolName: json['schoolName'] as String,
      schoolLevel: json['schoolLevel'] as String,
      schoolGrade: json['schoolGrade'] as String,
      gender: json['gender'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$UserBodyToJson(UserBody instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'schoolName': instance.schoolName,
      'schoolLevel': instance.schoolLevel,
      'schoolGrade': instance.schoolGrade,
      'gender': instance.gender,
      'photoUrl': instance.photoUrl,
    };
