import 'package:json_annotation/json_annotation.dart';

part 'idd.g.dart';

@JsonSerializable()
class Idd {
  final String root;
  final List<String> suffixes;

  Idd({
    required this.root,
    required this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) => _$IddFromJson(json);

  Map<String, dynamic> toJson() => _$IddToJson(this);
}
