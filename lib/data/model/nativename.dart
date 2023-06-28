import 'nativename_translations.dart';

class NativeName {
  final Map<String, NativeNameTranslations> nativeName;

  NativeName({required this.nativeName});

  factory NativeName.fromJson(Map<String, dynamic> json) {
    final nativeName = json.map(
      (key, value) => MapEntry(
        key,
        NativeNameTranslations.fromJson(value),
      ),
    );
    return NativeName(nativeName: nativeName);
  }
}
