import 'package:json_annotation/json_annotation.dart';

part 'flag.g.dart';

@JsonSerializable()
class Flags {
  final String png;
  final String svg;
  final String? alt;

  Flags({required this.png, required this.svg, this.alt});

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);

  Map<String, dynamic> toJson() => _$FlagsToJson(this);
}
