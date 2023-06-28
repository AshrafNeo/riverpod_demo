// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
import 'capital_info.dart';
import 'car.dart';
import 'coatofarms.dart';
import 'currencies.dart';
import 'demonyms.dart';
import 'flag.dart';
import 'gini.dart';
import 'idd.dart';
import 'languages.dart';
import 'maps.dart';
import 'name.dart';
import 'postal_code.dart';
import 'translations.dart';

part 'countries.g.dart';

@JsonSerializable()
@NameConvertor()
@TranslationsConvertor()
@CurrencyConvertor()
class Country {
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final String region;
  final String? subRegion;
  @JsonKey(name: 'landlocked')
  final bool landLocked;
  final num area;
  final String flag;
  final int population;
  final String fifa;
  final String startOfWeek;

  final Name name;
  final List<String> tld;
  final Currencies currencies;
  final Idd idd;
  final List<String> capital;
  final List<String> altSpellings;
  final Languages languages;
  final Translations translations;
  final List<num> latlng;
  final List<String> borders;
  final Demonyms demonyms;
  final Maps map;
  final Gini gini;
  final Car car;
  final List<String> timezones;
  final List<String> continents;
  final Flags flags;
  final CoatOfArms coatOfArms;
  final CapitalInfo capitalInfo;
  final PostalCode postalCode;

  Country({
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.region,
    this.subRegion,
    required this.landLocked,
    required this.area,
    required this.flag,
    required this.population,
    required this.fifa,
    required this.startOfWeek,
    required this.name,
    required this.tld,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.borders,
    required this.demonyms,
    required this.map,
    required this.gini,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
