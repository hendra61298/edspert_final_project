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
      userName: json['userName'] as String?,
      userEmail: json['userEmail'] as String?,
      userFoto: json['userFoto'] as String?,
      userAsalSekolah: json['userAsalSekolah'] as String?,
      dateCreate: json['dateCreate'] as String?,
      jenjang: json['jenjang'] as String?,
      userGender: json['userGender'] as String?,
      userStatus: json['userStatus'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'iduser': instance.iduser,
      'userName': instance.userName,
      'userEmail': instance.userEmail,
      'userFoto': instance.userFoto,
      'userAsalSekolah': instance.userAsalSekolah,
      'dateCreate': instance.dateCreate,
      'jenjang': instance.jenjang,
      'userGender': instance.userGender,
      'userStatus': instance.userStatus,
    };
