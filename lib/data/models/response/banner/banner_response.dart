
import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/banner_data.dart';

part 'banner_response.g.dart';

@JsonSerializable()
class BannerResponse {
  int? status;
  String? message;
  List<BannerData>? data;

  BannerResponse({this.status, this.message, this.data});

  factory BannerResponse.fromJson(Map<String, dynamic> json) => _$BannerResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BannerResponseToJson(this);

}