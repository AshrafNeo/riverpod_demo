import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_demo/data/model/currencies.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  group("returns currencies object from JSON", () {
    test(
      ("FROM JSON"),
      () => {
        expect(
          Currencies.fromJson(jsonDecode(fixture('currencies.json'))),
          isA<Currencies>().having((p0) => p0.currencies, "JOD",
              {"name": "Jordanian dinar", "symbol": "د.ا"}),
        ),
      },
    );
  });
}
