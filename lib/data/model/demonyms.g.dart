// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demonyms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Demonyms _$DemonymsFromJson(Map<String, dynamic> json) => Demonyms(
      demonyms: (json['demonyms'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, DemonymTranslations.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$DemonymsToJson(Demonyms instance) => <String, dynamic>{
      'demonyms': instance.demonyms,
    };

DemonymTranslations _$DemonymTranslationsFromJson(Map<String, dynamic> json) =>
    DemonymTranslations(
      f: json['f'] as String,
      m: json['m'] as String,
    );

Map<String, dynamic> _$DemonymTranslationsToJson(
        DemonymTranslations instance) =>
    <String, dynamic>{
      'f': instance.f,
      'm': instance.m,
    };
