// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      iduser: json['iduser'] as String?,
      userName: json['user_name'] as String?,
      userEmail: json['user_email'] as String?,
      userFoto: json['user_foto'] as String?,
      userAsalSekolah: json['user_asal_sekolah'] as String?,
      dateCreate: json['date_create'] as String?,
      jenjang: json['jenjang'] as String?,
      userGender: json['user_gender'] as String?,
      userStatus: json['user_status'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'iduser': instance.iduser,
      'user_name': instance.userName,
      'user_email': instance.userEmail,
      'user_foto': instance.userFoto,
      'user_asal_sekolah': instance.userAsalSekolah,
      'date_create': instance.dateCreate,
      'jenjang': instance.jenjang,
      'user_gender': instance.userGender,
      'user_status': instance.userStatus,
    };
