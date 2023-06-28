import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_demo/data/model/postal_code.dart';

void main() {
  final tPostalCode = PostalCode(format: "#####", regex: 'r^(\\d{5})');

  test('should be postal code class ', () async {
    expect(tPostalCode, isA<PostalCode>());
  });

  group('Postal Code', () {
    group('fromJson', () {
      test('returns correct Postal Code object', () {
        expect(
            PostalCode.fromJson(
              <String, dynamic>{"format": "#####", "regex": "^(\\d{5})"},
            ),
            isA<PostalCode>()
                .having((w) => w.format, 'format', '#####')
                .having((w) => w.regex, 'regex', '^(\\d{5})'));
      });
    });
  });
}
