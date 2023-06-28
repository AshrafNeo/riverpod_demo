import 'package:json_annotation/json_annotation.dart';

part 'capital_info.g.dart';

@JsonSerializable()
class CapitalInfo {
  final List<num> latlng;

  CapitalInfo({required this.latlng});

  factory CapitalInfo.fromJson(Map<String, dynamic> json) =>
      _$CapitalInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CapitalInfoToJson(this);
}
