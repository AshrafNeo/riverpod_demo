// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postal_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostalCode _$PostalCodeFromJson(Map<String, dynamic> json) => PostalCode(
      format: json['format'] as String,
      regex: json['regex'] as String,
    );

Map<String, dynamic> _$PostalCodeToJson(PostalCode instance) =>
    <String, dynamic>{
      'format': instance.format,
      'regex': instance.regex,
    };
