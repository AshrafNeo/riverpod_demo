// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class Currencies {
  final Map<String, Currency> currencies;

  Currencies({required this.currencies});
}

class Currency {
  final String name;
  final String symbol;

  Currency({required this.name, required this.symbol});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'symbol': symbol,
    };
  }

  factory Currency.fromMap(Map<String, dynamic> map) {
    return Currency(
      name: map['name'] as String,
      symbol: map['symbol'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Currency.fromJson(String source) =>
      Currency.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CurrencyConvertor
    extends JsonConverter<Currencies, Map<String, dynamic>> {
  const CurrencyConvertor();

  @override
  Currencies fromJson(Map<String, dynamic> json) {
    final currencies = json.map(
      (key, value) => MapEntry(
        key,
        Currency.fromJson(value),
      ),
    );
    return Currencies(currencies: currencies);
  }

  @override
  Map<String, dynamic> toJson(Currencies object) {
    throw UnimplementedError();
  }
}
