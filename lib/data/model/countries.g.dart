// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      cca2: json['cca2'] as String,
      ccn3: json['ccn3'] as String,
      cca3: json['cca3'] as String,
      cioc: json['cioc'] as String,
      independent: json['independent'] as bool,
      status: json['status'] as String,
      unMember: json['unMember'] as bool,
      region: json['region'] as String,
      subRegion: json['subRegion'] as String?,
      landLocked: json['landlocked'] as bool,
      area: json['area'] as num,
      flag: json['flag'] as String,
      population: json['population'] as int,
      fifa: json['fifa'] as String,
      startOfWeek: json['startOfWeek'] as String,
      name:
          const NameConvertor().fromJson(json['name'] as Map<String, dynamic>),
      tld: (json['tld'] as List<dynamic>).map((e) => e as String).toList(),
      currencies: const CurrencyConvertor()
          .fromJson(json['currencies'] as Map<String, dynamic>),
      idd: Idd.fromJson(json['idd'] as Map<String, dynamic>),
      capital:
          (json['capital'] as List<dynamic>).map((e) => e as String).toList(),
      altSpellings: (json['altSpellings'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      languages: Languages.fromJson(json['languages'] as Map<String, dynamic>),
      translations: const TranslationsConvertor()
          .fromJson(json['translations'] as Map<String, dynamic>),
      latlng: (json['latlng'] as List<dynamic>).map((e) => e as num).toList(),
      borders:
          (json['borders'] as List<dynamic>).map((e) => e as String).toList(),
      demonyms: Demonyms.fromJson(json['demonyms'] as Map<String, dynamic>),
      map: Maps.fromJson(json['map'] as Map<String, dynamic>),
      gini: Gini.fromJson(json['gini'] as Map<String, dynamic>),
      car: Car.fromJson(json['car'] as Map<String, dynamic>),
      timezones:
          (json['timezones'] as List<dynamic>).map((e) => e as String).toList(),
      continents: (json['continents'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      flags: Flags.fromJson(json['flags'] as Map<String, dynamic>),
      coatOfArms:
          CoatOfArms.fromJson(json['coatOfArms'] as Map<String, dynamic>),
      capitalInfo:
          CapitalInfo.fromJson(json['capitalInfo'] as Map<String, dynamic>),
      postalCode:
          PostalCode.fromJson(json['postalCode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'cca2': instance.cca2,
      'ccn3': instance.ccn3,
      'cca3': instance.cca3,
      'cioc': instance.cioc,
      'independent': instance.independent,
      'status': instance.status,
      'unMember': instance.unMember,
      'region': instance.region,
      'subRegion': instance.subRegion,
      'landlocked': instance.landLocked,
      'area': instance.area,
      'flag': instance.flag,
      'population': instance.population,
      'fifa': instance.fifa,
      'startOfWeek': instance.startOfWeek,
      'name': const NameConvertor().toJson(instance.name),
      'tld': instance.tld,
      'currencies': const CurrencyConvertor().toJson(instance.currencies),
      'idd': instance.idd,
      'capital': instance.capital,
      'altSpellings': instance.altSpellings,
      'languages': instance.languages,
      'translations':
          const TranslationsConvertor().toJson(instance.translations),
      'latlng': instance.latlng,
      'borders': instance.borders,
      'demonyms': instance.demonyms,
      'map': instance.map,
      'gini': instance.gini,
      'car': instance.car,
      'timezones': instance.timezones,
      'continents': instance.continents,
      'flags': instance.flags,
      'coatOfArms': instance.coatOfArms,
      'capitalInfo': instance.capitalInfo,
      'postalCode': instance.postalCode,
    };
