// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerData _$BannerDataFromJson(Map<String, dynamic> json) => BannerData(
      eventId: json['event_id'] as String?,
      eventTitle: json['event_title'] as String?,
      eventDescription: json['event_description'] as String?,
      eventImage: json['event_image'] as String?,
      eventUrl: json['event_url'] as String?,
    );

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'event_title': instance.eventTitle,
      'event_description': instance.eventDescription,
      'event_image': instance.eventImage,
      'event_url': instance.eventUrl,
    };
