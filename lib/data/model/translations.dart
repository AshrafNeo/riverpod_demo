import 'package:json_annotation/json_annotation.dart';

import 'nativename_translations.dart';

class Translations {
  final Map<String, NativeNameTranslations> translations;

  Translations({required this.translations});

  // factory Translations.fromJson(Map<String, dynamic> json) {
  //   final translations = json.map(
  //     (key, value) => MapEntry(
  //       key,
  //       NativeNameTranslations.fromJson(value),
  //     ),
  //   );
  //   return Translations(translations: translations);
  // }
}

class TranslationsConvertor
    extends JsonConverter<Translations, Map<String, dynamic>> {
  const TranslationsConvertor();

  @override
  Translations fromJson(Map<String, dynamic> json) {
    final translations = json.map(
      (key, value) => MapEntry(
        key,
        NativeNameTranslations.fromJson(value),
      ),
    );
    return Translations(translations: translations);
  }

  @override
  Map<String, dynamic> toJson(Translations object) {
    throw UnimplementedError();
  }
}
