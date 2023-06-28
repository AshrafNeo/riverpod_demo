import 'package:json_annotation/json_annotation.dart';

part 'coatofarms.g.dart';

@JsonSerializable()
class CoatOfArms {
  final String png;
  final String svg;

  CoatOfArms({required this.png, required this.svg});

  factory CoatOfArms.fromJson(Map<String, dynamic> json) =>
      _$CoatOfArmsFromJson(json);

  Map<String, dynamic> toJson() => _$CoatOfArmsToJson(this);
}
