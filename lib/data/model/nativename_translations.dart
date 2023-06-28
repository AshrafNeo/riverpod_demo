class NativeNameTranslations {
  final String official;
  final String common;

  NativeNameTranslations({required this.official, required this.common});

  factory NativeNameTranslations.fromJson(Map<String, dynamic> json) {
    return NativeNameTranslations(
      official: json['official'],
      common: json['common'],
    );
  }
}
