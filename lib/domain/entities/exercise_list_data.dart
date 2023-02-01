
import 'package:json_annotation/json_annotation.dart';

part 'exercise_list_data.g.dart';

@JsonSerializable()
class ExerciseListData{

  @JsonKey(name: 'exercise_id')
  String? exerciseId;

  @JsonKey(name: 'exercise_title')
  String? exerciseTitle;

  @JsonKey(name: 'access_type')
  String? accessType;
  String? icon;

  @JsonKey(name: 'exercise_user_status')
  String? exerciseUserStatus;

  @JsonKey(name: 'jumlah_soal')
  String? jumlahSoal;

  @JsonKey(name: 'jumlah_done')
  int? jumlahDone;

  ExerciseListData(
      {this.exerciseId,
        this.exerciseTitle,
        this.accessType,
        this.icon,
        this.exerciseUserStatus,
        this.jumlahSoal,
        this.jumlahDone});

  factory ExerciseListData.fromJson(Map<String, dynamic> json) => _$ExerciseListDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ExerciseListDataToJson(this);
}