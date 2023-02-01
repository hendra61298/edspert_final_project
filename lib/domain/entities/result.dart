
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {

  @JsonKey(name: 'jumlah_benar')
  String? jumlahBenar;

  @JsonKey(name: 'jumlah_salah')
  String? jumlahSalah;

  @JsonKey(name: 'jumlah_tidak')
  String? jumlahTidak;

  @JsonKey(name: 'jumlah_score')
  String? jumlahScore;

  Result({this.jumlahBenar, this.jumlahSalah, this.jumlahTidak, this.jumlahScore});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}