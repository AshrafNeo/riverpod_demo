import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_demo/data/model/capital_info.dart';

void main() {
  final tCapitalInfo = CapitalInfo(latlng: [31.95, 35.93]);

  test('should be capital info code class ', () async {
    expect(tCapitalInfo, isA<CapitalInfo>());
  });

  group('capital Code', () {
    group('fromJson', () {
      test('returns correct Postal Code object', () {
        expect(
          CapitalInfo.fromJson(
            <String, dynamic>{
              'latlng': [31.95, 35.93]
            },
          ),
          isA<CapitalInfo>().having(
            (w) => w.latlng,
            'latlng',
            [31.95, 35.93],
          ),
        );
      });
    });
  });
}
