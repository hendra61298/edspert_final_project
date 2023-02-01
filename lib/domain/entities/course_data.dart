
import 'package:json_annotation/json_annotation.dart';

part 'course_data.g.dart';

@JsonSerializable()
class CourseData{

  @JsonKey(name: 'course_id')
  String? courseId;

  @JsonKey(name: 'major_name')
  String? majorName;

  @JsonKey(name: 'course_category')
  String? courseCategory;

  @JsonKey(name: 'course_name')
  String? courseName;

  @JsonKey(name: 'url_cover')
  String? urlCover;

  @JsonKey(name: 'jumlah_materi')
  int? jumlahMateri;

  @JsonKey(name: 'jumlah_done')
  int? jumlahDone;
  int? progress;

  CourseData(
      {this.courseId,
        this.majorName,
        this.courseCategory,
        this.courseName,
        this.urlCover,
        this.jumlahMateri,
        this.jumlahDone,
        this.progress});

  factory CourseData.fromJson(Map<String, dynamic> json) => _$CourseDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CourseDataToJson(this);
}