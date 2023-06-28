import 'package:json_annotation/json_annotation.dart';

part 'languages.g.dart';

@JsonSerializable()
class Languages {
  final Map<String, String> languages;

  Languages({
    required this.languages,
  });

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}
