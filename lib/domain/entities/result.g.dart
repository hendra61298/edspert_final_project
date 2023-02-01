// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      jumlahBenar: json['jumlah_benar'] as String?,
      jumlahSalah: json['jumlah_salah'] as String?,
      jumlahTidak: json['jumlah_tidak'] as String?,
      jumlahScore: json['jumlah_score'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'jumlah_benar': instance.jumlahBenar,
      'jumlah_salah': instance.jumlahSalah,
      'jumlah_tidak': instance.jumlahTidak,
      'jumlah_score': instance.jumlahScore,
    };
