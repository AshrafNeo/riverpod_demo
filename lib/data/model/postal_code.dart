import 'package:json_annotation/json_annotation.dart';

part 'postal_code.g.dart';

@JsonSerializable()
class PostalCode {
  final String format;
  final String regex;

  PostalCode({required this.format, required this.regex});

  factory PostalCode.fromJson(Map<String, dynamic> json) =>
      _$PostalCodeFromJson(json);

  Map<String, dynamic> toJson() => _$PostalCodeToJson(this);
}
