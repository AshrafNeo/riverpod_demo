import 'package:json_annotation/json_annotation.dart';

part 'demonyms.g.dart';

@JsonSerializable()
class Demonyms {
  final Map<String, DemonymTranslations> demonyms;
  Demonyms({required this.demonyms});

  factory Demonyms.fromJson(Map<String, dynamic> json) =>
      _$DemonymsFromJson(json);

  Map<String, dynamic> toJson() => _$DemonymsToJson(this);
}

@JsonSerializable()
class DemonymTranslations {
  final String f;
  final String m;

  DemonymTranslations({required this.f, required this.m});

  factory DemonymTranslations.fromJson(Map<String, dynamic> json) =>
      _$DemonymTranslationsFromJson(json);

  Map<String, dynamic> toJson() => _$DemonymTranslationsToJson(this);
}
