import 'package:json_annotation/json_annotation.dart';

part 'maps.g.dart';

@JsonSerializable()
class Maps {
  final String googleMaps;
  final String openStreetMaps;

  Maps({required this.googleMaps, required this.openStreetMaps});

  factory Maps.fromJson(Map<String, dynamic> json) => _$MapsFromJson(json);

  Map<String, dynamic> toJson() => _$MapsToJson(this);
}
