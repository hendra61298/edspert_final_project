
import 'package:json_annotation/json_annotation.dart';

part 'question_list_data.g.dart';

@JsonSerializable()
class QuestionListData{

  @JsonKey(name: 'exercise_id_fk')
  String? exerciseId;

  @JsonKey(name: 'bank_question_id')
  String? questionId;

  @JsonKey(name: 'question_title')
  String? questionTitle;

  @JsonKey(name: 'question_title_img')
  String? questionTitleImg;

  @JsonKey(name: 'option_a')
  String? optionA;

  @JsonKey(name: 'option_a_img')
  String? optionAImg;

  @JsonKey(name: 'option_b')
  String? optionB;

  @JsonKey(name: 'option_b_img')
  String? optionBImg;

  @JsonKey(name: 'option_c')
  String? optionC;

  @JsonKey(name: 'option_c_img')
  String? optionCImg;

  @JsonKey(name: 'option_d')
  String? optionD;

  @JsonKey(name: 'option_d_img')
  String? optionDImg;

  @JsonKey(name: 'option_e')
  String? optionE;

  @JsonKey(name: 'option_e_img')
  String? optionEImg;

  @JsonKey(name: 'student_answer')
  String? studentAnswer;

  QuestionListData(
      {this.exerciseId,
        this.questionId,
        this.questionTitle,
        this.questionTitleImg,
        this.optionA,
        this.optionAImg,
        this.optionB,
        this.optionBImg,
        this.optionC,
        this.optionCImg,
        this.optionD,
        this.optionDImg,
        this.optionE,
        this.optionEImg,
        this.studentAnswer});

  factory QuestionListData.fromJson(Map<String, dynamic> json) => _$QuestionListDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$QuestionListDataToJson(this);
}