import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_demo/data/model/name.dart';
import 'package:riverpod_demo/data/model/nativename.dart';
import 'package:riverpod_demo/data/model/nativename_translations.dart';
import '../../fixtures/fixtures_reader.dart';

void main() {
  final tName = Name(
    common: "common",
    official: "offcial",
    nativeName: NativeName(
      nativeName: {
        "ara": NativeNameTranslations(
          common: "المملكة الأردنية الهاشمية",
          official: "الأردن",
        )
      },
    ),
  );
  test("Test is name model", () async {
    expect(tName, isA<Name>());
  });

  group("check if json returns correct name object", () {
    test(
        "from json must return name object",
        () => {
              expect(
                NativeName.fromJson(
                  jsonDecode(
                    fixture('names.json'),
                  )['nativeName'],
                ),
                isA<NativeName>()
                    // .having((n) => n.common, "common", "Jordan")
                    // .having(
                    //   (n) => n.official,
                    //   "official",
                    //   "Hashemite Kingdom of Jordan",
                    // )
                    .having((n) => n.nativeName, "nativeName", {
                  "ara": {
                    "official": "المملكة الأردنية الهاشمية",
                    "common": "الأردن"
                  },
                  "ben": {
                    "official": "المملكة الأردنية الهاشمية",
                    "common": "الأردن"
                  }
                }),
              )
            });
  });

  // group('Check if json returns correct name object', () {
  //   test(
  //       'from json return name object',
  //       () => {
  //             expect(
  //               Name.fromJson(
  //                 jsonDecode(
  //                   fixture('names.json'),
  //                 ),
  //               ),
  //               isA<Name>()
  //                   .having((n) => n.common, 'common', "Jordan")
  //                   .having((n) => n.official, "official",
  //                       "Hashemite Kingdom of Jordan")
  //                   .having(
  //                 (n) => n.nativeName,
  //                 "nativeName",
  //                 {
  //                   "ara": {
  //                     "official": "المملكة الأردنية الهاشمية",
  //                     "common": "الأردن"
  //                   }
  //                 },
  //               ),
  //             )
  //           });
  // });
}
