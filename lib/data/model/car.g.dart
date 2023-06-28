// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      signs: (json['signs'] as List<dynamic>).map((e) => e as String).toList(),
      side: json['side'] as String,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'signs': instance.signs,
      'side': instance.side,
    };
