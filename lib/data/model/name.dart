import 'package:json_annotation/json_annotation.dart';

import 'nativename.dart';

class Name {
  final String common;
  final String official;
  final NativeName nativeName;
  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'],
      official: json['official'],
      nativeName: NativeName.fromJson(json['nativeName']),
    );
  }
}

class NameConvertor extends JsonConverter<Name, Map<String, dynamic>> {
  const NameConvertor();

  @override
  Name fromJson(Map<String, dynamic> json) {
    return Name(
      common: json['common'],
      official: json['official'],
      nativeName: NativeName.fromJson(json['nativeName']),
    );
  }

  @override
  Map<String, dynamic> toJson(Name object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
