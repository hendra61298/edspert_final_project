import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse{
  int? status;
  String? message;
  UserData? data;

  UserResponse({this.status, this.message, this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserData {
  String? iduser;

  @JsonKey(name: 'user_name')
  String? userName;

  @JsonKey(name: 'user_email')
  String? userEmail;

  @JsonKey(name: 'user_foto')
  String? userFoto;

  @JsonKey(name: 'user_asal_sekolah')
  String? userAsalSekolah;

  @JsonKey(name: 'date_create')
  String? dateCreate;
  String? jenjang;

  @JsonKey(name: 'user_gender')
  String? userGender;

  @JsonKey(name: 'user_status')
  String? userStatus;

  UserData(
      {this.iduser,
        this.userName,
        this.userEmail,
        this.userFoto,
        this.userAsalSekolah,
        this.dateCreate,
        this.jenjang,
        this.userGender,
        this.userStatus});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}