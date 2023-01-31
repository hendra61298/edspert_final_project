
import 'package:json_annotation/json_annotation.dart';

part 'register_user_request.g.dart';

@JsonSerializable()
class UserBody{
  final String fullName;
  final String email;
  final String schoolName;
  final String schoolLevel;
  final String schoolGrade;
  final String gender;
  final String? photoUrl;

  const UserBody({
    required this.fullName,
    required this.email,
    required this.schoolName,
    required this.schoolLevel,
    required this.schoolGrade,
    required this.gender,
    this.photoUrl,
  });


  factory UserBody.fromJson(Map<String, dynamic> json) => _$UserBodyFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserBodyToJson(this);
}