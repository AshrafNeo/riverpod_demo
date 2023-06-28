import 'package:json_annotation/json_annotation.dart';

part 'gini.g.dart';

@JsonSerializable()
class Gini {
  final Map<String, num> gini;

  Gini({required this.gini});

  factory Gini.fromJson(Map<String, dynamic> json) => _$GiniFromJson(json);

  Map<String, dynamic> toJson() => _$GiniToJson(this);
}
