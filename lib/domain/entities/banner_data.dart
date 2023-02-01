
import 'package:json_annotation/json_annotation.dart';
part 'banner_data.g.dart';

@JsonSerializable()
class BannerData{

  @JsonKey(name: 'event_id')
  String? eventId;

  @JsonKey(name: 'event_title')
  String? eventTitle;

  @JsonKey(name: 'event_description')
  String? eventDescription;

  @JsonKey(name: 'event_image')
  String? eventImage;

  @JsonKey(name: 'event_url')
  String? eventUrl;

  BannerData({this.eventId, this.eventTitle, this.eventDescription, this.eventImage, this.eventUrl});

  factory BannerData.fromJson(Map<String, dynamic> json) => _$BannerDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BannerDataToJson(this);

}