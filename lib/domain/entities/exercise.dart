
import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable()
class Exercise{

  @JsonKey(name: 'exercise_id')
  String? exerciseId;

  @JsonKey(name: 'exercise_code')
  String? exerciseCode;

  @JsonKey(name: 'file_course')
  String? fileCourse;
  String? icon;

  @JsonKey(name: 'exercise_title')
  String? exerciseTitle;

  @JsonKey(name: 'exercise_description')
  String? exerciseDescription;

  @JsonKey(name: 'exercise_instruction')
  String? exerciseInstruction;

  @JsonKey(name: 'count_question')
  String? countQuestion;

  @JsonKey(name: 'class_fk')
  String? classFk;

  @JsonKey(name: 'course_fk')
  String? courseFk;

  @JsonKey(name: 'course_content_fk')
  String? courseContentFk;

  @JsonKey(name: 'sub_course_content_fk')
  String? subCourseContentFk;

  @JsonKey(name: 'creator_id')
  String? creatorId;

  @JsonKey(name: 'creator_name')
  String? creatorName;

  @JsonKey(name: 'exam_from')
  String? examFrom;

  @JsonKey(name: 'access_type')
  String? accessType;

  @JsonKey(name: 'exercise_order')
  String? exerciseOrder;

  @JsonKey(name: 'exercise_status')
  String? exerciseStatus;

  @JsonKey(name: 'date_create')
  String? dateCreate;

  @JsonKey(name: 'date_update')
  String? dateUpdate;

  Exercise(
      {this.exerciseId,
        this.exerciseCode,
        this.fileCourse,
        this.icon,
        this.exerciseTitle,
        this.exerciseDescription,
        this.exerciseInstruction,
        this.countQuestion,
        this.classFk,
        this.courseFk,
        this.courseContentFk,
        this.subCourseContentFk,
        this.creatorId,
        this.creatorName,
        this.examFrom,
        this.accessType,
        this.exerciseOrder,
        this.exerciseStatus,
        this.dateCreate,
        this.dateUpdate});

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}