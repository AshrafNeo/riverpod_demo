import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_demo/data/model/capital_info.dart';
import 'package:riverpod_demo/data/model/car.dart';
import 'package:riverpod_demo/data/model/coatofarms.dart';
import 'package:riverpod_demo/data/model/countries.dart';
import 'package:riverpod_demo/data/model/currencies.dart';
import 'package:riverpod_demo/data/model/demonyms.dart';
import 'package:riverpod_demo/data/model/flag.dart';
import 'package:riverpod_demo/data/model/gini.dart';
import 'package:riverpod_demo/data/model/idd.dart';
import 'package:riverpod_demo/data/model/languages.dart';
import 'package:riverpod_demo/data/model/maps.dart';
import 'package:riverpod_demo/data/model/name.dart';
import 'package:riverpod_demo/data/model/nativename.dart';
import 'package:riverpod_demo/data/model/nativename_translations.dart';
import 'package:riverpod_demo/data/model/postal_code.dart';
import 'package:riverpod_demo/data/model/translations.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  final tCountry = Country(
      cca2: "JO",
      ccn3: "400",
      cca3: "JOR",
      cioc: "JOR",
      independent: true,
      status: "offcially-assigned",
      unMember: true,
      region: "Asia",
      subRegion: "Western Asia",
      landLocked: false,
      area: 89342,
      flag: "🇯🇴",
      population: 10203140,
      fifa: "JOR",
      startOfWeek: "sunday",
      name: Name(
          common: "Jordan",
          official: "Hashemitte",
          nativeName: NativeName(nativeName: {
            "ara": NativeNameTranslations(common: "jordan", official: "jor")
          })),
      tld: ['tld'],
      currencies: Currencies(
        currencies: {
          "JOD": Currency(
            name: "name",
            symbol: "symbol",
          )
        },
      ),
      idd: Idd(root: 'aqwer', suffixes: ['suf', 'sT']),
      capital: ["AMMAN"],
      altSpellings: ["alt"],
      languages: Languages(
        languages: {
          "ara": "Arabic",
        },
      ),
      translations: Translations(
        translations: {
          "ara": NativeNameTranslations(
            official: 'official',
            common: 'common',
          ),
        },
      ),
      latlng: [31, 36],
      borders: ['borders', 'IRQ'],
      demonyms: Demonyms(demonyms: {
        "eng": DemonymTranslations(
          f: "Jordanian",
          m: "Jordanian",
        )
      }),
      map: Maps(
        googleMaps: "https://goo.gl/maps/ko1dzSDKg8Gsi9A98",
        openStreetMaps: "https://www.openstreetmap.org/relation/184818",
      ),
      gini: Gini(gini: {"2010": 33.7}),
      car: Car(signs: ['HKJ'], side: "right"),
      timezones: ["UTC+03:00"],
      continents: ["Asia"],
      flags: Flags(
          png: "https://flagcdn.com/w320/jo.png",
          svg: "https://flagcdn.com/jo.svg",
          alt:
              "The flag of Jordan is composed of three equal horizontal bands of black, white and green, with a red isosceles triangle superimposed on the hoist side of the field. This triangle has its base on the hoist end, spans about half the width of the field and bears a small seven-pointed white star at its center."),
      coatOfArms: CoatOfArms(
        png: "https://mainfacts.com/media/images/coats_of_arms/jo.png",
        svg: "https://mainfacts.com/media/images/coats_of_arms/jo.png",
      ),
      capitalInfo: CapitalInfo(latlng: [31.95, 35.93]),
      postalCode: PostalCode(format: "#####", regex: "^(\\d{5})"));

  test('should be Country class ', () async {
    expect(tCountry, isA<Country>());
  });

  group('country code', () {
    group('fromJson', () {
      test(
        "returns correct country object",
        () {
          expect(
            Country.fromJson(
              jsonDecode(
                fixture('countries.json'),
              ),
            ),
            isA<Country>()
                .having(
                  (c) => c.name,
                  'name',
                  {
                    "common": "Jordan",
                    "official": "Hashemite Kingdom of Jordan",
                    "nativeName": {
                      "ara": {
                        "official": "المملكة الأردنية الهاشمية",
                        "common": "الأردن"
                      }
                    }
                  },
                )
                .having(
                  (c) => c.tld,
                  'tld',
                  [".jo", "الاردن."],
                )
                .having(
                  (c) => c.cca2,
                  "cca2",
                  "JO",
                )
                .having(
                  (c) => c.ccn3,
                  "ccn3",
                  "400",
                )
                .having(
                  (c) => c.cioc,
                  "cioc",
                  "JOR",
                )
                .having(
                  (c) => c.independent,
                  "independent",
                  true,
                )
                .having(
                  (c) => c.unMember,
                  "unMember",
                  true,
                )
                .having((c) => c.currencies, "currencies", {
                  "JOD": {"name": "Jordanian dinar", "symbol": "د.ا"}
                })
                .having((c) => c.idd, "idd", {
                  "root": "+9",
                  "suffixes": ["62"]
                })
                .having(
                  (c) => c.capital,
                  "capital",
                  ["Amman"],
                )
                .having((c) => c.altSpellings, "altSpellings", [
                  "JO",
                  "Hashemite Kingdom of Jordan",
                  "al-Mamlakah al-Urdunīyah al-Hāshimīyah"
                ])
                .having(
                  (c) => c.region,
                  "region",
                  "Asia",
                )
                .having(
                  (c) => c.subRegion,
                  'subregion',
                  "Western Asia",
                )
                .having(
                  (c) => c.languages,
                  "languages",
                  {"ara": "Arabic"},
                )
                .having((c) => c.translations, "translations", {
                  "ara": {
                    "official": "المملكة الأردنية الهاشمية",
                    "common": "الأردن"
                  },
                  "bre": {
                    "official": "Rouantelezh hachemit Jordania",
                    "common": "Jordania"
                  },
                  "ces": {
                    "official": "Jordánské hášimovské království",
                    "common": "Jordánsko"
                  },
                  "cym": {
                    "official": "Hashemite Kingdom of Jordan",
                    "common": "Jordan"
                  },
                  "deu": {
                    "official": "Haschemitisches Königreich Jordanien",
                    "common": "Jordanien"
                  },
                  "est": {
                    "official": "Jordaania Hašimiidi Kuningriik",
                    "common": "Jordaania"
                  },
                  "fin": {
                    "official": "Jordanian hašemiittinen kunigaskunta",
                    "common": "Jordania"
                  },
                  "fra": {
                    "official": "Royaume hachémite de Jordanie",
                    "common": "Jordanie"
                  },
                  "hrv": {
                    "official": "Hašemitske Kraljevine Jordan",
                    "common": "Jordan"
                  },
                  "hun": {"official": "Jordánia", "common": "Jordánia"},
                  "ita": {
                    "official": "Regno hascemita di Giordania",
                    "common": "Giordania"
                  },
                  "jpn": {"official": "ヨルダン·ハシミテ王国", "common": "ヨルダン"},
                  "kor": {"official": "요르단 하심 왕국", "common": "요르단"},
                  "nld": {
                    "official": "Hasjemitisch Koninkrijk Jordanië",
                    "common": "Jordanië"
                  },
                  "per": {"official": "پادشاهی اُردُن هاشمی", "common": "اردن"},
                  "pol": {
                    "official": "Jordańskie Królestwo Haszymidzkie",
                    "common": "Jordania"
                  },
                  "por": {
                    "official": "Reino Hachemita da Jordânia",
                    "common": "Jordânia"
                  },
                  "rus": {
                    "official": "Иорданского Хашимитского Королевства",
                    "common": "Иордания"
                  },
                  "slk": {
                    "official": "Jordánske hášimovské kráľovstvo",
                    "common": "Jordánsko"
                  },
                  "spa": {
                    "official": "Reino Hachemita de Jordania",
                    "common": "Jordania"
                  },
                  "srp": {
                    "official": "Хашемитска Краљевина Јордан",
                    "common": "Јордан"
                  },
                  "swe": {
                    "official": "Hashimitiska kungadömet Jordanien",
                    "common": "Jordanien"
                  },
                  "tur": {
                    "official": "Ürdün Hâşimi Krallığı",
                    "common": "Ürdün"
                  },
                  "urd": {"official": "ھاشمی مملکتِ اردن", "common": "اردن"},
                  "zho": {"official": "约旦哈希姆王国", "common": "约旦"}
                })
                .having((c) => c.latlng, 'latlng', [31.0, 36.0])
                .having(
                  (c) => c.landLocked,
                  "landlocked",
                  false,
                )
                .having((c) => c.borders, "borders",
                    ["IRQ", "ISR", "PSE", "SAU", "SYR"])
                .having(
                  (c) => c.area,
                  "area",
                  89342.0,
                )
                .having((c) => c.demonyms, "demonyms", {
                  "eng": {"f": "Jordanian", "m": "Jordanian"},
                  "fra": {"f": "Jordanienne", "m": "Jordanien"}
                })
                .having(
                  (c) => c.flag,
                  "flag",
                  "\uD83C\uDDEF\uD83C\uDDF4",
                )
                .having((c) => c.map, "maps", {
                  "googleMaps": "https://goo.gl/maps/ko1dzSDKg8Gsi9A98",
                  "openStreetMaps":
                      "https://www.openstreetmap.org/relation/184818"
                })
                .having(
                  (c) => c.population,
                  "population",
                  10203140,
                )
                .having(
                  (c) => c.gini,
                  "gini",
                  {"2010": 33.7},
                )
                .having(
                  (c) => c.fifa,
                  "fifa",
                  "JOR",
                )
                .having((c) => c.car, "car", {
                  "signs": ["HKJ"],
                  "side": "right"
                })
                .having(
                  (c) => c.timezones,
                  "timezones",
                  ["UTC+03:00"],
                )
                .having((c) => c.continents, "continents", ["Asia"])
                .having((c) => c.flags, "flags", {
                  "png": "https://flagcdn.com/w320/jo.png",
                  "svg": "https://flagcdn.com/jo.svg",
                  "alt":
                      "The flag of Jordan is composed of three equal horizontal bands of black, white and green, with a red isosceles triangle superimposed on the hoist side of the field. This triangle has its base on the hoist end, spans about half the width of the field and bears a small seven-pointed white star at its center."
                })
                .having((c) => c.coatOfArms, "coatOfArms", {
                  "png":
                      "https://mainfacts.com/media/images/coats_of_arms/jo.png",
                  "svg":
                      "https://mainfacts.com/media/images/coats_of_arms/jo.svg"
                })
                .having((c) => c.startOfWeek, "startOfWeek", "sunday")
                .having((c) => c.capitalInfo, "capitalInfo", {
                  "latlng": [31.95, 35.93]
                })
                .having(
                  (c) => c.postalCode,
                  "postalCode",
                  {"format": "#####", "regex": "^(\\d{5})"},
                ),
          );
        },
      );
    });
  });
}
